#!/usr/bin/env bash    # indique d'utiliser bash (interpréteur trouvé dans PATH)
# create_promo.sh - création d'une promo, groupes et arborescence sécurisée
# Usage: create_promo.sh [-dry-run] PROMO_NAME
# Ex: sudo ./create_promo.sh promo2026
#      ./create_promo.sh -dry-run promo2026

LOGFILE="/var/log/creation_promo.log"    # fichier de journalisation central
DRY_RUN=0    # 0 = exécution réelle, 1 = simulation (ne modifie rien)

timestamp() { date "+%F %T"; }    # renvoie la date/heure formatée pour les logs

log() {
    local level="$1"; shift    # niveau du log (INFO, OK, ERROR, ...)
    local msg="$*"            # message du log (le reste des arguments)
    printf '%s [%s] %s\n' "$(timestamp)" "$level" "$msg" | tee -a "$LOGFILE"  # écrit dans le logfile et stdout
}

run_cmd() {
    local cmd="$*"    # commande complète passée à la fonction
    if [ "$DRY_RUN" -eq 1 ]; then
        log "DRY-RUN" "$cmd"    # en dry-run, on n'exécute pas: on affiche ce qu'on ferait
        return 0
    fi
    eval "$cmd"    # exécute la commande (évalue variables/quotes)
    local rc=$?      # récupère le code de sortie
    if [ $rc -ne 0 ]; then
        log "ERROR" "Command failed (rc=$rc): $cmd"    # log d'erreur en cas d'échec
        exit $rc                                       # quitte le script en renvoyant le code d'erreur
    else
        log "OK" "$cmd"    # log de succès
    fi
}

usage() {
    cat <<EOF
Usage: $0 [-dry-run] PROMO_NAME
  -dry-run    : simulate actions without changing the system
  PROMO_NAME  : enter name of the promo
EOF
    exit 1    # quitte en indiquant une mauvaise utilisation
}

# ---- parse args ----
if [ "$1" = "-dry-run" ]; then
    DRY_RUN=1    # active le mode simulation si premier argument est -dry-run
    shift        # décale les paramètres pour que $1 devienne le nom de promo
fi

PROMO="$1"    # nom de la promo (ex: promo2026)
if [ -z "$PROMO" ]; then
    echo "Erreur: nom de la promo requis."    # message court si pas de param
    usage
fi

# validate promo name (simple)
if [[ ! "$PROMO" =~ ^[a-zA-Z0-9._-]+$ ]]; then
    echo "Nom de promo invalide: seuls [A-Za-z0-9._-] sont autorisés."  # filtre caractères
    exit 1
fi

# Must run as root for groupadd, chown, writing /srv and /var/log
if [ "$EUID" -ne 0 ] && [ "$DRY_RUN" -eq 0 ]; then
    echo "Ce script doit être exécuté en tant que root. Utilisez sudo."  # nécessite privilèges
    exit 1
fi

# ---- configuration ----
BASE="/srv/formations/$PROMO"     # chemin racine où créer la promo
DIRS=(etudiants formateurs partages) # sous-dossiers à créer
GRP_ET="grp_etudiants_${PROMO}"    # nom du groupe étudiants pour cette promo
GRP_FORM="grp_formateurs_${PROMO}" # nom du groupe formateurs pour cette promo

# set secure umask
UMASK=027    # umask sécurisé: pas d'accès 'others', groupe a accès limité
if [ "$DRY_RUN" -eq 1 ]; then
    log "INFO" "DRY-RUN mode - umask would be set to $UMASK"  # log si simulation
else
    umask "$UMASK"    # applique le umask pour ce processus
    log "INFO" "umask set to $UMASK"
fi

# Start actions
log "INFO" "Début création promo: $PROMO (dry-run=$DRY_RUN)"    # log de début

# 1) création groupes (ignore si existe)
run_cmd "groupadd -f $GRP_ET"     # crée le groupe étudiants (silencieux si existe)
run_cmd "groupadd -f $GRP_FORM"   # crée le groupe formateurs

# 2) création arborescence
run_cmd "mkdir -p '$BASE'"        # crée le dossier racine (avec parents si besoin)

for d in "${DIRS[@]}"; do
    run_cmd "mkdir -p '$BASE/$d'"   # crée chaque sous-dossier (etudiants, formateurs, partages)
done

# 3) droits et ownerships
# etudiants : owner root, group grp_etudiants, setgid, pas d'accès aux autres
run_cmd "chown root:$GRP_ET '$BASE/etudiants'"  # owner=root, group=grp_etudiants
run_cmd "chmod 2770 '$BASE/etudiants'"          # 2=setgid, 7 owner,7 group,0 others

# formateurs : owner root, group grp_formateurs, setgid, full for owner+group
run_cmd "chown root:$GRP_FORM '$BASE/formateurs'"
run_cmd "chmod 2770 '$BASE/formateurs'"

# partages : accessible aux deux groupes, pas aux autres
# Strategy: set group to grp_formateurs, setgid, chmod 2770, then add ACL for grp_etudiants if setfacl available
run_cmd "chown root:$GRP_FORM '$BASE/partages'"
run_cmd "chmod 2770 '$BASE/partages'"

if command -v setfacl >/dev/null 2>&1; then
    run_cmd "setfacl -m g:$GRP_ET:rwx '$BASE/partages'"   # donne rwx au groupe étudiants via ACL
    run_cmd "setfacl -m g:$GRP_FORM:rwx '$BASE/partages'" # assure aussi rwx pour formateurs
    run_cmd "setfacl -d -m g:$GRP_ET:rwx '$BASE/partages'"# ACL par défaut pour nouveaux fichiers/dossiers
    run_cmd "setfacl -d -m g:$GRP_FORM:rwx '$BASE/partages'"# idem pour formateurs
    log "INFO" "ACLs appliquées pour permettre accès aux deux groupes"
else
    log "WARN" "setfacl absent: les administrateurs devront configurer manuellement l'accès du second groupe au dossier 'partages'"
fi

# 4) recommandations pour dossiers étudiants individuels
log "INFO" "Note: pour limiter cdchaque étudiant à son dossier, créer des sous-dossiers sous $BASE/etudiants avec owner=user et chmod 700." # conseil pour dossiers perso

log "INFO" "Fin création promo: $PROMO"  # log de fin
exit 0
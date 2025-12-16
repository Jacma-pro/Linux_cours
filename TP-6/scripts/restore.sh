#!/bin/bash

BACKUP_DIR="/backup"
RESTORE_DIR="/restore_test"

echo "Recherche de la derniere sauvegarde dans $BACKUP_DIR..."

if [ ! -d "$BACKUP_DIR" ]; then
    echo "Erreur : Le dossier $BACKUP_DIR n'existe pas."
    exit 1
fi


archives=($(ls -t "$BACKUP_DIR"/*.tar.gz 2>/dev/null))

if [ ${#archives[@]} -eq 0 ]; then
    echo "Erreur : Aucune archive trouvee dans $BACKUP_DIR."
    exit 1
fi

echo "Archives disponibles :"
for i in "${!archives[@]}"; do
    echo "  $((i+1))) $(basename "${archives[$i]}")"
done

echo ""
read -p "Choisissez le numero de l'archive a restaurer (ex: 1) : " choice

if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt "${#archives[@]}" ]; then
    echo "Choix invalide."
    exit 1
fi

SELECTED_ARCHIVE="${archives[$((choice-1))]}"

echo "Restauration de : $SELECTED_ARCHIVE"

if [ -d "$RESTORE_DIR" ]; then
    rm -rf "$RESTORE_DIR"
fi
mkdir -p "$RESTORE_DIR"
tar -xzf "$SELECTED_ARCHIVE" -C "$RESTORE_DIR"

if [ $? -eq 0 ]; then
    echo "Restauration terminee dans : $RESTORE_DIR"
    echo "Contenu restaure :"
    ls -F "$RESTORE_DIR"
else
    echo "Erreur lors de la restauration."
    exit 1
fi

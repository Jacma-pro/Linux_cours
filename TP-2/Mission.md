
# 🔍 Missions possibles à distribuer

## Niveau 1 - Découverte
1. Trouve le fichier qui liste tous les utilisateurs enregistrés.
2. Trouve le répertoire personnel de ton utilisateur.
3. Trouve le fichier qui contient le nom de la machine.
4. Trouve où sont stockés les logs du système.
5. Trouve la version exacte de ton système Linux.
6. Trouve le dossier contenant les périphériques physiques.

### 📋 Tableau à compléter :
Mission | Fichier ou dossier trouvé | Commande(s) utilisée(s) | Ce que le fichier contient | Rôle supposé
--- | --- | --- | --- | ---
1 | `/etc/passwd` | `sudo cat /etc/passwd` | Liste des utilisateurs du système | Contient les informations sur les utilisateurs
2 | `/home/[ton_utilisateur]` | `cd ~` | Répertoire personnel de l'utilisateur
3 | `/etc/hostname` | `cat /etc/hostname` | Nom de la machine | Contient le nom de l'ordinateur
4 | `/var/log` | `sudo ls /var/log` | Dossiers et fichiers de logs | Stocke les journaux du système
5 | `/etc/os-release` | `cat /etc/os-release` | Informations sur la version de Linux | Contient les détails de la distribution
6 | `/dev` | `ls /dev` | Fichiers de périphériques | Contient les fichiers représentant les périphériques matériels

## Niveau 2 - Exploration

1. Trouve où sont configurés les services qui démarrent automatiquement.
2. Trouve la configuration du réseau.
3. Trouve où se situe le noyau Linux sur le disque.
4. Trouve le fichier de configuration du shell Bash.
5. Trouve où sont stockés les mots de passe des utilisateurs.
6. Trouve un fichier qui affiche la mémoire utilisée.

### 📋 Tableau à compléter :
Mission | Fichier ou dossier trouvé | Commande(s) utilisée(s) | Ce que le fichier contient | Rôle supposé
--- | --- | --- | --- | ---
1 | `/etc/init.d` | `ls /etc/init.d` | Scripts de démarrage des services | Contient les scripts pour les services au démarrage
2 | `/etc/network/interfaces` | `cat /etc/network/interfaces`ou alors `ls /etc/netplan/00-installer-config.yaml; ls /etc/netplan/01-network-manager-all.yaml` | Configuration réseau | Contient les paramètres réseau
3 | `/boot/vmlinuz-6.17.0-5-generic` | `ls /boot` | Fichier du noyau Linux | Contient le noyau utilisé par le système
4 | `~/.bashrc` | `cat ~/.bashrc` | Configuration du shell Bash | Contient les paramètres et alias pour Bash
5 | `/etc/shadow` | `sudo cat /etc/shadow` | Mots de passe des utilisateurs | Contient les mots de passe chiffrés
6 | `/proc/meminfo` | `cat /proc/meminfo` | Informations sur la mémoire | Affiche l'utilisation de la mémoire système (on remarquera que le mot de passe de mon utilisateur est haché dans ce fichier)

## Niveau 3 - Expert

1. Trouve la liste des processus en cours d’exécution.
2. Trouve les périphériques montés sur le système.
3. Trouve un fichier qui contient les infos de la carte réseau.
4. Trouve le dossier réservé à l’utilisateur root.
5. Trouve les 10 plus gros fichiers du système.
6. Trouve où sont stockés les logs du noyau.

### 📋 Tableau à compléter :
Mission | Fichier ou dossier trouvé | Commande(s) utilisée(s) | Ce que le fichier contient | Rôle supposé
--- | --- | --- | --- | ---

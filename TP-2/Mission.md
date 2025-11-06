
# 🔍 Différentes missions pour comprendre le système

**Lien des consignes :** [TP-2](https://sand-metacarpal-859.notion.site/TP-2-Exploration-du-syst-me-Linux-28fa4f0ae4ab80dda976de38b1d2247c)

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
2 | `/home/[user_name]` | `cd ~` | Répertoire personnel de l'utilisateur
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
1 | `/etc/systemd/system` | `ls /etc/systemd/system` | Scripts de démarrage des services | Contient les scripts pour les services au démarrage
2 | `/etc/netplan/00-installer-config.yaml` & `/etc/netplan/01-network-manager-all.yaml` | `sudo cat /etc/netplan/00-installer-config.yaml; sudo cat /etc/netplan/01-network-manager-all.yaml` | Configuration réseau | Contient les paramètres réseau
3 | `/boot/vmlinuz` | `ls /boot` | Fichier du noyau Linux | Contient le noyau utilisé par le système (note pour moi même : ne pas faire `sudo cat` dessus !, Je l'ai fait et ça a affiché des caractères bizarres, (c'est juste que c'est encodé en fait))
4 | `/etc/bash.bashrc` | `cat /etc/bash.bashrc` | Configuration du shell Bash | Contient les paramètres et alias pour Bash
5 | `/etc/shadow` | `sudo cat /etc/shadow` | Mots de passe des utilisateurs | Contient les mots de passe (on remarquera que le mot de passe de mon utilisateur est haché dans ce fichier)
6 | `/proc/meminfo` | `cat /proc/meminfo` | Informations sur la mémoire | Affiche l'utilisation de la mémoire système

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
1 | `/proc/[PID]`  | `cat /proc/[PID]/status` ou `ps aux` | Informations sur les processus | Contient des informations détaillées sur chaque processus en cours
2 | `/proc/mounts` | `cat /proc/mounts` ou `df -h` | Liste des périphériques montés | Contient les points de montage des systèmes de fichiers
3 | `/sys/class/net/` ou `/proc/net/dev` | `ls /sys/class/net/` ou `cat /proc/net/dev` | Informations sur la carte réseau | Contient des informations sur les interfaces réseau
4 | `/root` | `cd /root` | Répertoire personnel de l'utilisateur root | Contient les fichiers de l'utilisateur root
5 | N/A | `voir ci-dessous` | Liste des plus gros fichiers | Affiche les 10 plus gros fichiers du système
6 | `/var/log/kern.log` | `sudo cat /var/log/kern.log` | Logs du noyau | Contient les messages et erreurs du noyau Linux

#### Commande (Niveau 3 - mission 5)

Voici la commande exacte à utiliser (bloc de code pour préserver les barres verticales) :

```bash
sudo du -ah / | sort -rh | head -n 10
```

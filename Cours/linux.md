# Linux

## Introduction

### Comprendre les bases d'un pc :

- Rôle du processeur (CPU) : exécuter les instructions des programmes.
- Rôle de la mémoire vive (RAM) : stocker temporairement les données et les programmes en cours d'utilisation.
- Rôle du disque dur (HDD/SSD) : stocker les données de manière permanente.
- Rôle de la carte mère : connecter tous les composants matériels.
- Rôle de la carte graphique (GPU) : gérer l'affichage des images à l'écran.

### Qu'est-ce qu'un système d'exploitation (OS) ?

#### Gestion des ressources matérielles :
Le système d'exploitation gère les composants matériels de l'ordinateur pour assurer leur bon fonctionnement.

#### Interface utilisateur-machine :
Le système d'exploitation fournit une interface permettant aux utilisateurs d'interagir avec l'ordinateur.

#### Exécution des applications :
Le système d'exploitation permet l'installation et l'exécution des programmes et applications.

## Introduction à Linux :

#### Qu'est-ce que Linux ?
Linux est un système d'exploitation open-source basé sur le noyau Linux. Il est largement utilisé pour sa stabilité, sa sécurité et sa flexibilité. Linux est disponible dans de nombreuses distributions (distros) telles que Ubuntu, Fedora, et Debian, chacune offrant des fonctionnalités et des environnements différents adaptés à divers besoins utilisateurs.

#### Historique rapide :
Linux a été créé en 1991 par Linus Torvalds. Depuis lors, il a évolué grâce à la contribution de développeurs du monde entier, devenant l'un des systèmes d'exploitation les plus populaires, notamment pour les serveurs, les superordinateurs et les appareils embarqués.

#### Philosophie open-source :
Linux suit la philosophie open-source, ce qui signifie que son code source est librement accessible, modifiable et redistribuable. Cela favorise la collaboration et l'innovation au sein de la communauté des développeurs.

#### Différences avec Windows et macOS :
Linux se distingue de Windows et macOS par sa nature open-source, sa personnalisation avancée, et son utilisation fréquente dans les environnements serveurs. Contrairement à Windows et macOS, qui sont des systèmes d'exploitation propriétaires, Linux permet aux utilisateurs de modifier et d'adapter le système selon leurs besoins spécifiques.

#### Usage dans les serveurs :
Linux alimente 90% des serveurs web dans le monde, grâce à sa stabilité, sa sécurité et sa capacité à gérer de lourdes charges de travail.

#### Présence dans Android :
Android, le système d'exploitation mobile le plus utilisé, est basé sur le noyau Linux, ce qui démontre la flexibilité et l'adaptabilité de Linux dans divers environnements technologiques.

#### Objets connectés et surpercalculateurs :
Linux est également largement utilisé dans les objets connectés (IoT) et les supercalculateurs, en raison de sa légèreté, de sa modularité et de sa capacité à être personnalisé pour des applications spécifiques.

### Avantages de Linux :

- **Gratuit et open-source** : Pas de coûts de licence, avec une communauté active pour le support et le développement.
- **Sécurité** : Moins vulnérable aux virus et malwares grâce à sa architecture et à la gestion des permissions.
- **Personnalisation** : Large choix de distributions et d'environnements de bureau pour répondre aux besoins spécifiques des utilisateurs.
- **Stabilité et performance** : Fonctionne efficacement sur du matériel ancien et gère bien les ressources système.
- **Lien avec DevOps** : Linux est la plateforme de choix pour de nombreux outils et pratiques DevOps, facilitant l'automatisation, le déploiement continu et la gestion des infrastructures.
- **Communauté active** : Support et ressources abondantes grâce à une vaste communauté d'utilisateurs et de développeurs.

## Architecture de Linux :

L'architecture de Linux se compose de plusieurs couches, chacune ayant des responsabilités spécifiques :

1. **Noyau (Kernel)** :
   - Le noyau est le cœur du système d'exploitation. Il gère les ressources matérielles, les processus, la mémoire et les périphériques. Le noyau Linux est monolithique, ce qui signifie qu'il gère tout dans un seul espace mémoire, un peu comme un chef d'orchestre qui coordonne toutes les parties du système.

2. **Shell** :
   - Le shell est l'interface entre l'utilisateur et le noyau. Il permet aux utilisateurs d'exécuter des commandes et des scripts. Il existe plusieurs types de shells, tels que Bash, Zsh et Fish.

3. **Systèmes de fichiers** :
   - Linux prend en charge plusieurs systèmes de fichiers, tels que ext4, XFS et Btrfs. Le système de fichiers organise et gère les données sur le disque dur.

4. **Services et applications** :
   - Linux dispose d'une vaste gamme de services et d'applications, allant des outils de ligne de commande aux environnements de bureau complets. Ces applications sont souvent disponibles via des gestionnaires de paquets.

5. **Interface utilisateur graphique (GUI)** :
   - Bien que Linux soit principalement utilisé via la ligne de commande, il existe de nombreuses interfaces graphiques disponibles, telles que GNOME, KDE et Xfce, qui facilitent l'utilisation du système pour les utilisateurs moins expérimentés.


### Les 5 rôles clés du nouyau :
1. **Gestion des processus** : Le noyau gère la création, l'exécution et la terminaison des processus, assurant une allocation efficace du temps CPU.
2. **Gestion de la mémoire** : Il alloue et libère la mémoire pour les processus, optimisant l'utilisation de la RAM.
3. **Contrôle des fichiers** : Le noyau gère les systèmes de fichiers, permettant la lecture, l'écriture et l'organisation des données sur le disque.
4. **et 5. Gestion des périphériques et des réseaux** : Le noyau contrôle les périphériques matériels (claviers, souris, disques durs) et gère les communications réseau, assurant une interaction fluide entre le matériel et le logiciel.

### 1. Un même noyau, plusieurs "habillages" :

- **Toutes les distributions Linux utilisent le même noyau de base, le noyau Linux.**

- Mais autour de ce noyau, chaque distribution propose des "habillages" différents, c'est-à-dire des ensembles de logiciels, d'environnements de bureau et de configurations qui varient selon les besoins des utilisateurs.

### 2. Ce qui change d'un e distribution à l'autre :

**Elément** | **Exemple** | **Ce que ça change**
--- | --- | ---
Gesttionnaire de paquets | APT (Debian/Ubuntu) vs YUM/DNF (Fedora) | Méthode d'installation et de mise à jour des logiciels
Environnement de bureau | GNOME (Ubuntu) vs KDE (KDE Neon) | Apparence et fonctionnalités de l'interface utilisateur
Philosophie et objectifs | Ubuntu (facilité d'utilisation) vs Arch Linux (personnalisation) | Public cible et expérience utilisateur
Cycle de mise à jour | Rolling release (Arch Linux) vs versions fixes (Ubuntu LTS) | Fréquence et nature des mises à jour logicielles
Support & communauté | Ubuntu (grande communauté) vs Gentoo (communauté plus restreinte) | Disponibilité de l'aide et des ressources


### 3. Les Grandes familles de distributions :

- **Linux**
    - Debian
        - Ubuntu
            - Linux Mint
            - Pop!_OS
        - Raspbian
    - Red Hat
        - Fedora
        - CentOS / Rocky Linux
    - Arch Linux
        - Manjaro
        - EndeavourOS


## Commandes de base Linux :
Voici quelques commandes de base pour naviguer et gérer un système Linux via le terminal :

- `ls` : Liste les fichiers et répertoires dans le répertoire courant.
- `cd [répertoire]` : Change le répertoire courant vers le répertoire spécifié.
- `pwd` : Affiche le chemin complet du répertoire courant.
- `cp [source] [destination]` : Copie un fichier ou un répertoire.
- `mv [source] [destination]` : Déplace ou renomme un fichier ou un répertoire.
- `rm [fichier]` : Supprime un fichier.
- `mkdir [répertoire]` : Crée un nouveau répertoire.
- `rmdir [répertoire]` : Supprime un répertoire vide.
- `touch [fichier]` : Crée un nouveau fichier vide ou met à jour la date de modification d'un fichier existant.
- `cat [fichier]` : Affiche le contenu d'un fichier.
- `nano [fichier]` : Ouvre un éditeur de texte en ligne de commande.
- `sudo [commande]` : Exécute une commande avec les privilèges de superutilisateur.
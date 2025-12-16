# Un script sauvegarde un dossier critique (`/etc`, `/var/www`, `/home/...`) dans une archive compressée.

#!/bin/bash

backupSource="/etc"
backupDest="/backup"
timestamp=$(date +"%Y%m%d_%H%M%S")
backupFile="$backupDest/backup_$(basename $backupSource)_$timestamp.tar.gz"

mkdir -p "$backupDest"

echo "Sauvegarde de $backupSource vers $backupFile..."
tar -czPf "$backupFile" "$backupSource" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "Sauvegarde terminée avec succès."
else
    echo "Erreur lors de la sauvegarde."
    exit 1
fi
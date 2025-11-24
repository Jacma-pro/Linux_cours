# Un script sauvegarde un dossier critique (`/etc`, `/var/www`, `/home/...`) dans une archive compressée.

#!/bin/bash

backupSource="/etc"
backupDest="/backup"
timestamp=$(date +"%Y%m%d_%H%M%S")
backupFile="$backupDest/backup_$(basename $backupSource)_$timestamp.tar.gz"
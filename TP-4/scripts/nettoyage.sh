# Script pour supprimer les fichiers .log modifiés il y a moins de 7 jours dans /var/log

#!/bin/bash

for file in /var/log/*.log
do
fileDate=$(stat -c %Y "$file")
currentDate=$(date +%Y)
diffDays=$(( (currentDate - fileDate) / 86400 ))
if [ $diffDays -le 7 ]; then
    rm "$file"
    echo "le $file à été supprimé"
fi
done
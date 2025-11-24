#!/bin/bash

# Un script affiche la charge CPU, la RAM, l’espace disque et les processus principaux.
resultFile="system_report.txt"

{
    echo "Rapport système - $(date)"
    echo "------------------------------"
    echo
    echo "Charge CPU :"
    top -bn1 | grep "Cpu(s)" | sed 's/^/   /'
    echo
    echo "Utilisation de la RAM :"
    free -h | sed -n '2p' | sed 's/^/   /'
    echo
    echo "Espace disque :"
    df -h | awk '$NF=="/"{printf "   Utilisation disque: %s/%s (%s)\n", $3,$2,$5}'
    echo
    echo "Processus principaux par utilisation CPU :"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
    echo
    echo "Processus principaux par utilisation RAM :"
    ps -eo pid,comm,%mem --sort=-%mem | head -n 6
    echo
    echo "Fin du rapport système."
    echo
    echo "=============================="
    echo
} > "$resultFile"
echo "Le rapport système a été généré dans le fichier $resultFile."
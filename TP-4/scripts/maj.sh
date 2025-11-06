#!/bin/bash

logfile="/var/log/maj/maj.log"

{
  echo "Mise à jour démarrée le: $(date)"
  apt update
  apt upgrade -y
  echo "Mise à jour terminée le: $(date)"
  echo " "
  echo "----------------------------------------"
  echo " "
} 2>&1 | tee -a "$logfile"

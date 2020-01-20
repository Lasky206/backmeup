#!/bin/bash

# Print the menu
clear

echo
echo "###########################################"
echo "##                                       ##"
echo "##              MAIN MENU                ##"
echo "##                                       ##"
echo "###########################################"
echo


# Functions to print list / menu
ENTITIES=$(ls ./Scripts -1)
# Filter out this script and the backup / restore scripts
SELECTION=1
PWD=$(pwd)


echo "B) Backup"
echo "R) Restore"
echo

while read -r line; do
  echo "$SELECTION) `sed 's/_/ /g' <<< $line | sed 's/\.sh//g'`"
  #Echo selection and replace _ with " " then pipe into sed ot remove .sh
  let "SELECTION=SELECTION+1"
  # alternative (($ENTITIES++))
done <<< $ENTITIES
echo
echo "Q) Quit"
echo

# Collect user input
read -r -p "Select an entity from the above list: " opt
# alternative:
# read -r opt
# printf "Select and entity from the above list: "
if [[ `seq 1 $SELECTION` =~ $opt ]]; then
  ./Scripts/`sed -n "${opt}p" <<< "$ENTITIES"`
  ./backmeup.sh
elif [[ $opt =~ ^[Qq]$ ]]; then
# =~ extends regex to the operator to the right of it
# then ^ begins regex, $ ends regex, and [] evaluates
# against all charachters inside
  echo "exiting"
  sleep 3
  exit 0
elif [[ $opt =~ ^[Bb]$ ]]; then
  ./file_backup.sh
elif [[ $opt =~ ^[Rr]$ ]]; then
  ./file_restore.sh
fi

#!/bin/bash


clear


ENTITIES=$(ls -1 | egrep -v "file_backup.sh|file_restore.sh|tmp|annotated.sh|notes.txt|README.md|master.sh|slave.sh")
SELECTION=1
PWD=$(pwd)


echo
echo "###########################################"
echo "##                                       ##"
echo "##               MAIN MENU               ##"
echo "##                                       ##"
echo "###########################################"
echo
echo "B) Backup"
echo "R) Restore"
echo


while read -r line; do
  echo "$SELECTION) `sed 's/_/ /g' <<< $line | sed 's/\.sh//g'`"
  let "SELECTION=SELECTION+1"
done <<< $ENTITIES


echo
echo "Q) Quit"
echo


read -r -p "Select an entity from the above list: " opt


if [[ `seq 1 $SELECTION` =~ $opt ]]; then
  ./slave.sh `sed -n "${opt}p" <<< "$ENTITIES"`
  ./master.sh
elif [[ $opt =~ ^[Qq]$ ]]; then
  exit 0
elif [[ $opt =~ ^[Bb]$ ]]; then
  ./file_backup.sh
  ./master.sh
elif [[ $opt =~ ^[Rr]$ ]]; then
  ./file_restore.sh
  ./master.sh
fi

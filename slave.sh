#!/bin/bash


clear


SUBENTITIES=$(ls -1 $1)
SELECTION=1


echo
echo "###########################################"
echo "##                                       ##"
echo "          $1                               "
echo "##                                       ##"
echo "###########################################"
echo

while read -r line; do
  echo "$SELECTION) `sed 's/_/ /g' <<< $line | sed 's/\.sh//g'`"
  let "SELECTION=SELECTION+1"
done <<< $SUBENTITIES


echo
echo "Q) Quit"
echo


read -r -p "Select an entity from the above list: " opt


if [[ `seq 1 $SELECTION` =~ $opt ]]; then
  ./$1/`sed -n "${opt}p" <<< "$SUBENTITIES"`
  ./slave.sh $1
elif [[ $opt =~ ^[Qq]$ ]]; then
  exit 0
fi

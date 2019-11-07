#!/bin/bash


clear


TARBALL=('~/Documents' '~/Pictures' '~/.ssh' '~/.certs' '/etc/NetworkManager/system-connections')


dpkg -s atom &> /dev/null
if [ $? == 0 ]; then TARBALL+=('~/.atom'); fi
snap list remmina
if [ $? == 0 ]; then TARBALL+=('~/snap/remmina/current/.local/share/remmina'); fi



echo "TARBalling the following directories: "
echo


for i in ${TARBALL[*]}; do
  echo $i
done

echo

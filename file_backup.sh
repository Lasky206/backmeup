#!/bin/bash


clear


TARBALL=('~/Documents' '~/Pictures' '~/.ssh' '~/.certs' '/etc/NetworkManager/system-connections')


print_list () {
  clear
  echo "TARBalling the following directories: "
  echo
  for i in ${TARBALL[*]}; do
    echo $i
  done
  echo
}


dpkg -s atom &> /dev/null
if [ $? == 0 ]; then TARBALL+=('~/.atom'); fi
snap list remmina
if [ $? == 0 ]; then TARBALL+=('~/snap/remmina/current/.local/share/remmina'); fi


print_list


echo


read -r -p "Would you like to add any custom locations? [y/N]: " opt


if [[ "$opt" =~ ^[Yy]$ ]]; then
  read -r -p "Enter the path you'd like to add: " opt2
  TARBALL+=('test')
  echo ${TARBALL[*]}
  sleep 10
  ./file_backup.sh
else
  :
fi


read -r -p "Ready to continue? [y/N]: " opt


if [[ "$opt" =~ ^[Yy]$ ]]; then
  echo "continue"
else
  print_list
fi

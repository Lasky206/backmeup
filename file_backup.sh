#!/bin/bash


clear


PWD=$(pwd)
TARBALL=(~/Documents ~/Pictures ~/.ssh /etc/NetworkManager/system-connections)
NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'


print_list() {
  clear
  echo "TARBalling the following directories: "
  echo
  for i in ${TARBALL[*]}; do
    echo "[*]  $i"
  done
  echo
  echo
}


# Determin if folders exist


# Determin if certain packages are needed for backups
dpkg -s atom &> /dev/null
if [ $? == 0 ]; then TARBALL+=(~/.atom/config.cson); fi
snap list remmina &> /dev/null
if [ $? == 0 ]; then TARBALL+=(~/snap/remmina/current/.local/share/remmina); fi


print_list


while true; do
  # Add custom backup locations
  read -r -p "Would you like to add another location? [y/N]: " opt
  if [[ "$opt" =~ ^[Yy]$ ]]; then
    read -r -p "Enter the path you'd like to add: " opt
    TARBALL+=(${opt})
    print_list
  else
    break
  fi
done


# Determin location to store backup
read -r -p "Where would you like to save the backup?: " backup_path
cd $backup_path
tar -czf BMU_backup.tgz ${TARBALL[*]}
if [ $? = 0 ]; then
  clear
  printf "The backup ${GREEN}completed sucessfully${NC}"
  sleep 5
else
  clear
  printf "The backup ${RED}FAILED!${NC}"
  sleep 5
fi

cd $PWD
exit 0

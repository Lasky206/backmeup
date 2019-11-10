#!/bin/bash


clear


PWD=$(pwd)
TARBALL=()
NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'

banner() {
  echo
  echo "###########################################"
  echo "##                                       ##"
  echo "##               Backup                  ##"
  echo "##                                       ##"
  echo "###########################################"
  echo
}

print_list() {
  clear
  banner
  echo "TARBalling the following directories: "
  echo
  for i in ${TARBALL[*]}; do
    echo "[*]  $i"
  done
  echo
  echo
}


# Determin if folders exist
ls ~/Documents &> /dev/null
if [ $? == 0 ]; then TARBALL+=(~/Documents); fi
ls ~/Pictures &> /dev/null
if [ $? == 0 ]; then TARBALL+=(~/Pictures); fi
ls ~/.ssh &> /dev/null
if [ $? == 0 ]; then TARBALL+=(~/.ssh); fi
ls /etc/NetworkManager/system-connections &> /dev/null
if [ $? == 0 ]; then TARBALL+=(/etc/NetworkManager/system-connections); fi

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
  banner
  printf "The backup ${GREEN}completed sucessfully${NC}"
  sleep 5
else
  clear
  banner
  printf "The backup ${RED}FAILED!${NC}"
  sleep 5
fi

cd $PWD
exit 0

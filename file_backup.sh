#!/bin/bash


clear


TARBALL=('~/Documents' '~/Pictures' '~/.ssh' '~/.certs' '/etc/NetworkManager/system-connections')


print_list() {
  clear
  echo "TARBalling the following directories: "
  echo
  for i in ${TARBALL[*]}; do
    echo $i
  done
  echo
}

#
# ###### EXPERIMENTAL ##########
# add_to_list() {
#   # Add custom backup locations
#   read -r -p "Would you like to add any custom locations? [y/N]: " opt
#
#
#   if [[ "$opt" =~ ^[Yy]$ ]]; then
#     read -r -p "Enter the path you'd like to add: " opt
#     echo $opt
#   else
#     :
#   fi
# }
# ##############################
#

# Determin if certain packages are needed for backups
dpkg -s atom &> /dev/null
if [ $? == 0 ]; then TARBALL+=('~/.atom'); fi
snap list remmina
if [ $? == 0 ]; then TARBALL+=('~/snap/remmina/current/.local/share/remmina'); fi


print_list


echo


# Add custom backup locations
read -r -p "Would you like to add any custom locations? [y/N]: " opt


if [[ "$opt" =~ ^[Yy]$ ]]; then
  read -r -p "Enter the path you'd like to add: " opt
  TARBALL+=('test')
  ./file_backup.sh
else
  :
fi


# Run Backup
read -r -p "Ready to continue? [y/N]: " opt


if [[ "$opt" =~ ^[Yy]$ ]]; then
  echo "continue"
else
  print_list
fi

#!/bin/bash


banner() {
  echo
  echo "###########################################"
  echo "##                                       ##"
  echo "##               Restore                 ##"
  echo "##                                       ##"
  echo "###########################################"
  echo
}


banner


read -r -p "Enter the path to your backup file: " opt
tar -xzf ${opt}/BMU_backup.tgz -C ~/
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

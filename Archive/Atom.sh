#!/bin/bash

NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'

#Prompt for dependencies before continue
read -r -p "Did you make a backup? [y/N]: " opt
if [[ $opt =~ ^[Yy]$ ]]; then
  read -r -p "Path to backup file: " opt
  tar -xzf $opt -C ~/
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
else
  :
fi

wget -O ./staging/atom.deb https://github.com/atom/atom/releases/download/v1.41.0/atom-amd64.deb
sudo dpkg -i ./staging/atom.deb
sudo apt install -f

# Check to see if Python is installed
dpkg -s Python &> /dev/null
if [ $? == 0 ]; then
  :
else
  echo "Python does not appear to be installed on this system. Some configurations may fail without it!"
  read -r -p "Would you like to install Python now? [Y/n]: " opt
  if [[ $opt =~ ^[Nn]$ ]]; then
    :
  else
    ./Python.sh
  fi
fi

pip install pycodestyle

apm install monokai@0.24.0
apm install city-lights-icons@1.1.1
apm install linter
apm install linter-ui-default
apm install linter-pycodestyle

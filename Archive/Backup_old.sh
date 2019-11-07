#!/bin/bash

#backup function
backup () {
  #obtain backup destination
  read -p 'Where would you like to save the backup to?: ' backup_path
  #backup system
  echo 'By default Documents, Pictures, and .ssh will be backed up'
  read -p 'List the full path to additional sources: ' sources

  cd $backup_path
  tar -cvf Backup.tar ~/Documents ~/Pictures ~/.ssh $sources
  gzip Backup.tar
}


#restore fucntion
restore () {
  #prompt for recovery file
  echo 'Place the backup tarball in the root of your user folder (i.e. ~/)'
  echo ''
  read -n 1 -s -r -p 'Press any key to continue'
  gunzip Backup.tar.gz
  tar -xf Backup.tar

  #navigate to executions location
  cd ~/

  #update os
  sudo apt update -y
  sudo apt upgrade -y
  sudo apt dist-upgrade -y

  #fetch packages
  wget -O atom.deb https://atom.io/download/deb
  wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
  wget -O skylinux.deb 'https://www.tel.red/linux.php?f=sky_2.1.7458-1ubuntu%2Bdisco_amd64.deb'
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

  wget -O vmware-client.bundle https://download3.vmware.com/software/view/viewclients/CART20FQ3/VMware-Horizon-Client-5.2.0-14604769.x64.bundle
  wget -O anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh

  #install packages
  sudo dpkg -i *.deb

  #open download pages
  firefox https://www.displaylink.com/downloads/ubuntu

  #launch chrome
  google-chrome

  chmod 777 vmware-client.bundle
  chmod 777 anaconda.sh

  mv vmware-client.bundle ~/Download
  ./anaconda.sh

  sudo apt install git -y
  sudo apt install gnome-tweaks -y
  sudo apt install openconnect -y
  sudo apt install dkms -y
  sudo snap install remmina
  sudo snap install discord

  #configure git
  git config --global user.name 'Lasky206'
  git config --global user.email 'mistermisterio1000@gmail.com'

  #configure atom
  apm install monokai@0.24.0
  apm install city-lights-icons@1.1.1

  #repair missing dependencies
  sudo apt install -f -y

  #remove un-used dependencies
  sudo apt autoremove -y

  #cleanup
  sudo rm -rf *.deb anaconda.sh
}



while true
do
  read -p 'Would you like to Backup or Restore?[B/R]: ' input
  if [[ $input = [Bb] ]]
    then
    backup
    break
  elif [[ $input = [Rr] ]]
    then
    restore
    break
  else
    exit 0
  fi
done

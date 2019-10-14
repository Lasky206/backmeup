#!/bin/bash

#backup function
backup () {
  #obtain backup destination
  read -p 'Where would you like to save the backup to?: ' backup_path
  #backup system
  cd $backup_path
  tar -cvf Backup.tar ~/Documents ~/Pictures ~/.ssh
  gzip Backup.tar
}


#restore fucntion
restore () {
  #navigate to executions location
  cd ~/

  #update os
  sudo apt update -y
  sudo apt upgrade -y
  sudo apt dist-upgrade -y

  #open download pages
  firefox https://www.displaylink.com/downloads/ubuntu

  #fetch packages
  wget https://atom.io/download/deb
  wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
  wget https://www.tel.red/linux.php?f=sky_2.1.7458-1ubuntu%2Bbionic_amd64.deb
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

  wget -O vmware-client.bundle https://download3.vmware.com/software/view/viewclients/CART20FQ3/VMware-Horizon-Client-5.2.0-14604769.x64.bundle
  wget -O anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh

  #install packages
  sudo dpkg -i *.deb

  unzip displaylink.zip

  chmod 777 vmware-client.bundle
  chmod 777 anaconda.sh

  ./vmware-client.bundle
  ./anaconda.sh

  sudo apt install git
  sudo apt install gnome-tweaks
  sudo snap install remmina

  #configure git
  git config --global user.name 'Lasky206'
  git config --global user.email 'mistermisterio1000@gmail.com'

  #configure atom
  apm install monokai@0.24.0
  apm install city-lights-icons@1.1.1

  sudo apt install -f -y

  #cleanup
  sudo rm -rf *.deb anaconda.sh vmware-client.bundle
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

#!/bin/bash

#backup function
backup () {
  #obtain backup destination
  read -p "Where would you like to save the backup to?: " backup_path
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

  #fetch packages
  wget -O atom.deb https://atom.io/download/deb
  wget -O dbeaver.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
  wget -O skylinux.deb https://www.tel.red/linux.php?f=sky_2.1.7458-1ubuntu%2Bbionic_amd64.deb
  wget -O chrome.deb https://www.google.com/chrome/thank-you.html?statcb=0&installdataindex=empty&defaultbrowser=0#
  wget -O displaylink.zip https://www.displaylink.com/downloads/file?id=1369

  wget -O vmware-client.bundle https://download3.vmware.com/software/view/viewclients/CART20FQ3/VMware-Horizon-Client-5.2.0-14604769.x64.bundle
  wget -O anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh

  #install packages
  sudo dpkg -i install atom.deb -y
  sudo dpkg -i install dbeaver.deb -y
  sudo dpkg -i install skylinux.deb -y
  sudo dpkg -i install chrome.deb -y

  unzip displaylink.zip

  chmod 777 displaylink-driver-5.2.14.run
  chmod 777 vmware-client.bundle
  chmod 777 anaconda.sh

  ./displaylink-driver-5.2.14.run
  ./vmware-client.bundle
  ./anaconda.sh

  sudo apt install utop -y
  sudo snap install remmina

  apm install monokai@0.24.0
  apm install city-lights-icons@1.1.1

  sudo apt install -f -y

  #cleanup
  sudo rm -rf anaconda.sh atom.deb chrome.deb dbeaver.deb skylinux.deb vmware-client.bundle displaylink.zip "DisplayLink\ USB\ Graphics\ Software\ for\ Ubuntu\ 5.2.zip"
}



while true
do
  read -p "Would you like to Backup or Restore?[B/R]: " input
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

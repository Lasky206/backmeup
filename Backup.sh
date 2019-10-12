#!/bin/bash

#backup system
tar -cvf Backup.tar ~/Documents ~/Pictures ~/.ssh

#update os
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y

#fetch packages
wget -O atom.deb https://atom.io/download/deb
wget -O dbeaver.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
wget -O skylinux.deb https://www.tel.red/linux.php?f=sky_2.1.7458-1ubuntu%2Bbionic_amd64.deb
wget -O chrome.deb https://www.google.com/chrome/thank-you.html?statcb=0&installdataindex=empty&defaultbrowser=0#

wget -O vmware-client.bundle https://download3.vmware.com/software/view/viewclients/CART20FQ3/VMware-Horizon-Client-5.2.0-14604769.x64.bundle
wget -O anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh

#install packages
dpkg -i install atom.deb -y
dpkg -i install dbeaver.deb -y
dpkg -i install skylinux.deb -y
dpkg -i install chrome.deb -y

chmod 777 vmware-client.bundle
chmod 777 anaconda.sh

./vmware-clinet.bundle
./anaconda.sh

sudo apt install

sudo snap install remmina -y

apm install monokai@0.24.0
apm install city-lights-icons@1.1.1

# while true
#   do
#     if [ 1 == 1 ]
#     then
#       echo "Hello World"
#     else
#       echo "Ollo"
#   fi
# done

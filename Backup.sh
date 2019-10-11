#backup system
tar -cvf Backup.tar ~/Documents ~/Pictures ~/.ssh

#fetch packages
wget -O atom.deb https://atom.io/download/deb
wget -O dbeaver.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb

#install packages
dpkg -i install

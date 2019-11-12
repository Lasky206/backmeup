#!/bin/bash


sudo apt install dkms -y
wget -O ./staging/displaylink-debian.sh https://raw.githubusercontent.com/AdnanHodzic/displaylink-debian/master/displaylink-debian.sh
sudo ./staging/displaylink-debian.sh

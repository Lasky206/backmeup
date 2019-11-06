#!/bin/bash

wget -P /tmp/ -O displaylink-debian.sh https://raw.githubusercontent.com/AdnanHodzic/displaylink-debian/master/displaylink-debian.sh
chmod 777 displaylink-debian.sh
sudo /tmp/displaylink-debian.sh

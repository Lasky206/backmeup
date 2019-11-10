#!/bin/bash

wget -O ./staging/dbeaver.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
dpkg -i ./staging/debeaver.deb
sudo apt install -f

#!/bin/bash

wget -O ./tmp/dbeaver.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
dpkg -i ./tmp/debeaver.deb
sudo apt install -f

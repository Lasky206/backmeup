#!/bin/bash

wget -P /tmp/ -O anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
/tmp/anaconda.sh
sudo apt install -f

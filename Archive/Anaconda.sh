#!/bin/bash


wget -O ./staging/anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
./staging/anaconda.sh
sudo apt install -f

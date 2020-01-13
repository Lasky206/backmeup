#!/bin/bash

wget -O ./staging/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ./staging/chrome.deb
sudo apt install -f

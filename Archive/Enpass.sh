#!/bin/bash

sudo echo "deb https://apt.enpass.io/ stable main" > /etc/apt/sources.list.d/enpass.list
sudo wget -q https://apt.enpass.io/keys/enpass-linux.key -O- | apt-key add -
sudo apt-get update
sudo apt-get install enpass

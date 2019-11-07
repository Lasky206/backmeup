#!/bin/bash

#Prompt for dependencies before continue

wget -O ./tmp/atom.deb https://github.com/atom/atom/releases/download/v1.41.0/atom-amd64.deb
dpkg -i ./tmp/atom.deb
sudo apt install -f

pip install pycodestyle

apm install monokai@0.24.0
apm install city-lights-icons@1.1.1
apm install linter
apm install linter-ui-default
apm install linter-pycodestyle

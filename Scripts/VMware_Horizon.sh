#!/bin/bash

wget -P /tmp/ -O horizon.bundle https://download3.vmware.com/software/view/viewclients/CART20FQ3/VMware-Horizon-Client-5.2.0-14604769.x64.bundle
sudo chmod 777 /tmp/horizon.bundle
sudo /tmp/horizon.bundle
sudo apt install -f

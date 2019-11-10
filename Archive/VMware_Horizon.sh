#!/bin/bash

wget -O ./staging/horizon.bundle https://download3.vmware.com/software/view/viewclients/CART20FQ3/VMware-Horizon-Client-5.2.0-14604769.x64.bundle
sudo chmod 777 ./staging/horizon.bundle
sudo ./staging/horizon.bundle
sudo apt install -f

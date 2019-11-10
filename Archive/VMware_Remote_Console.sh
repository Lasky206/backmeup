#!/bin/bash


wget -O ./staging/VMware-Remote-Console.bundle https://download2.vmware.com/software/vmrc/1006/VMware-Remote-Console-10.0.6-14247266.x86_64.bundle?HashKey=a288594c10ed2c8f2a454a27d9875764&params=%7B%22custnumber%22%3A%22amh0ZCpod3RqJQ%3D%3D%22%2C%22sourcefilesize%22%3A%2253.74+MB%22%2C%22dlgcode%22%3A%22VMRC1006%22%2C%22languagecode%22%3A%22en%22%2C%22source%22%3A%22DOWNLOADS%22%2C%22downloadtype%22%3A%22manual%22%2C%22eula%22%3A%22Y%22%2C%22downloaduuid%22%3A%228c134155-e477-4077-b8e7-d69cdf9c4fc6%22%2C%22purchased%22%3A%22N%22%2C%22dlgtype%22%3A%22Drivers+%26+Tools%22%2C%22productversion%22%3A%2210.0.6%22%2C%22productfamily%22%3A%22VMware+vSphere%22%7D&AuthKey=1573196983_affa58b8671614bf690f514523131d54


sudo chmod 777 ./staging/VMware-Remote-Console.bundle
sudo ./staging/VMware-Remote-Console.bundle
sudo apt install -f

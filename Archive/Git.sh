#!/bin/bash

sudo apt install git -y


read -r -p "What is your github username?: " user
read -r -p "What is your github email?: " email

#configure git
git config --global user.name '$user'
git config --global user.email '$email'

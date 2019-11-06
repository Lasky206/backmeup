#!/bin/#!/usr/bin/env bash

wget -P ./tmp -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i /tmp/chrome.deb
sudo apt install -f

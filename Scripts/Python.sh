#!/bin/bash

wget -P ./tmp -O python.tgz https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tgz
tar -xf /tmp/python.tgz /tmp/
./tmp/install-sh

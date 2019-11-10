#!/bin/bash

wget -O ./staging/python.tgz https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tgz
tar -xzf ./staging/python.tgz -C ./staging/
./tmp/Python-3.8.0/install-sh

#!/bin/bash

if [ $# != 0 ]; then
    echo "n/a"
else
    sudo chmod +x /myInfo.sh
    ./myInfo.sh
fi
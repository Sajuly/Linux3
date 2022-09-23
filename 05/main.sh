#!/bin/bash

if [ $# != 1 ]; then
        echo "n/a"
# elif [[ "${1: -1}" != "/" ]]; then  # проверка последнего символа
#         echo "n/a1"
elif [[ -d "$1" ]]; then # -d проверка file is a directory
        end=$(echo $1 | tail -c 2)  # символ в конце строки
        if [[ "$end" = "/" ]]; then
                export param=$1
                # sudo chmod +x info.sh
                ./info.sh
        fi
else 
        echo "n/a"
fi

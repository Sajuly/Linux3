#!/bin/bash

if [ $# != 1 ]; then   # $# - кол-во параметров
    echo "n/a"
elif [[ $1 =~ [0-9] ]]; then  # $1 - первый параметр | =~ если верно возвращеает 1
    echo "n/a"
else
    echo $1
fi
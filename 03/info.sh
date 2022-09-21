#!/bin/bash

arr[0]=$1;
arr[1]=$2;
arr[2]=$3;
arr[3]=$4;

function init_colors {

        for i in 0 1 2 3; do
                if [[ ${arr[$i]} < 1 || ${arr[$i]} > 6 ]]; then
                        echo "n/a"
                        exit 1
                fi
        done

        if [[ ${arr[0]} == ${arr[1]} ]]; then
                echo "the background and the color of the text cannot be the same!"
                exit 1
        elif [[ ${arr[2]} == ${arr[3]} ]]; then
                echo "the background and the color of the text cannot be the same!"
                exit 1
        fi

        whiteF="\033[107m"; redF="\033[41m"; greenF="\033[42m"; blueF="\033[44m"; purpleF="\033[45m"; blackF="\033[40m"
        whiteT="\033[97m"; redT="\033[31m"; greenT="\033[32m"; blueT="\033[34m"; purpleT="\033[35m"; blackT="\033[30m"
        reset="\e[0m"  # сбрасывает параметры цвета

        for i in 0 2; do   # берет по очереди сначала 0 потом 2
                if [[ ${arr[$i]} == 1 ]]; then
                        colors[$i]=$whiteF   # colors переменная для цвета 
                elif [[ ${arr[$i]} == 2 ]]; then
                        colors[$i]=$redF
                elif [[ ${arr[$i]} == 3 ]]; then
                        colors[$i]=$greenF
                elif [[ ${arr[$i]} == 4 ]]; then
                        colors[$i]=$blueF
                elif [[ ${arr[$i]} == 5 ]]; then
                        colors[$i]=$purpleF
                elif [[ ${arr[$i]} == 6 ]]; then
                        colors[$i]=$blackF
                fi
        done

        for i in 1 3; do
                if [[ ${arr[$i]} == 1 ]]; then
                        colors[$i]=$whiteT
                elif [[ ${arr[$i]} == 2 ]]; then
                        colors[$i]=$redT
                elif [[ ${arr[$i]} == 3 ]]; then
                        colors[$i]=$greenT
                elif [[ ${arr[$i]} == 4 ]]; then
                        colors[$i]=$blueT
                elif [[ ${arr[$i]} == 5 ]]; then
                        colors[$i]=$purpleT
                elif [[ ${arr[$i]} == 6 ]]; then
                        colors[$i]=$blackT
                fi
        done
}

function dataSetup {
        HOSTNAME=$(hostname)
        TIMEZONE="$(cat /etc/timezone) UTC $(date +"%Z")"
        USER=$(whoami)
        OS=$(cat /etc/issue | sed -n '1'p | awk '{printf("%s %s", $1, $2)}')
        DATE=$(date +"%d %b %Y %H:%M:%S")
        UPTIME=$(uptime -p)
        UPTIME_SEC=$(cat /proc/uptime | awk '{printf("%s", $1)}')
        IP=$(ip address | grep "inet.*enp0s3" | awk '{print $2}')
        MASK=$(ipcalc $IP | sed -n '2'p | awk '{printf("%s", $2)}')
        GATEWAY=$(ip route | sed -n '1'p | awk '{printf("%s", $3)}')
        RAM_TOTAL=$(free | sed -n '2'p | awk '{printf("%.3f Gb", $2 / 1024 / 1024)}')
        RAM_USED=$(free | sed -n '2'p | awk '{printf("%.3f Gb", $3 / 1024 / 1024)}')
        RAM_FREE=$(free | sed -n '2'p | awk '{printf("%.3f Gb", $4 / 1024 / 1024)}')
        SPACE_ROOT="$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')"
        SPACE_ROOT_USED=$(df | sed -n '4'p | awk '{printf("%.2f Gb", $3 / 1024 / 1024)}')
        SPACE_ROOT_FREE=$(df | sed -n '4'p | awk '{printf("%.2f Gb", $4 / 1024 / 1024)}')
}

function dataOutput {
        init_colors
        echo -e "${colors[0]}${colors[1]}HOSTNAME${reset} = ${colors[2]}${colors[3]}$HOSTNAME${reset}"
        echo -e "${colors[0]}${colors[1]}TIMEZONE${reset} = ${colors[2]} ${colors[3]}$TIMEZONE${reset}"
        echo -e "${colors[0]}${colors[1]}USER${reset} = ${colors[2]}${colors[3]}$USER${reset}"
        echo -e "${colors[0]}${colors[1]}OS${reset} = ${colors[2]}${colors[3]}$OS${reset}"
        echo -e "${colors[0]}${colors[1]}DATE${reset} = ${colors[2]}${colors[3]}$DATE${reset}"
        echo -e "${colors[0]}${colors[1]}UPTIME${reset} = ${colors[2]}${colors[3]}$UPTIME${reset}"
        echo -e "${colors[0]}${colors[1]}UPTIME_SEC${reset} = ${colors[2]}${colors[3]}$UPTIME_SEC${reset}"
        echo -e "${colors[0]}${colors[1]}IP${reset} = ${colors[2]}${colors[3]}$IP${reset}"
        echo -e "${colors[0]}${colors[1]}MASK${reset} = ${colors[2]}${colors[3]}$MASK${reset}"
        echo -e "${colors[0]}${colors[1]}GATEWAY${reset} = ${colors[2]}${colors[3]}$GATEWAY${reset}"
        echo -e "${colors[0]}${colors[1]}RAM_TOTAL${reset} = ${colors[2]}${colors[3]}$RAM_TOTAL${reset}"
        echo -e "${colors[0]}${colors[1]}RAM_USED${reset} = ${colors[2]}${colors[3]}$RAM_USED${reset}"
        echo -e "${colors[0]}${colors[1]}RAM_FREE${reset} = ${colors[2]}${colors[3]}$RAM_FREE${reset}"
        echo -e "${colors[0]}${colors[1]}SPACE_ROOT${reset} = ${colors[2]}${colors[3]}$SPACE_ROOT${reset}"
        echo -e "${colors[0]}${colors[1]}SPACE_ROOT_USED${reset} = ${colors[2]}${colors[3]}$SPACE_ROOT_USED${reset}"
        echo -e "${colors[0]}${colors[1]}SPACE_ROOT_FREE${reset} = ${colors[2]}${colors[3]}$SPACE_ROOT_FREE${reset}"
}

dataSetup
dataOutput

#!/bin/bash

trap ctrl_c INT
function ctrl_c() {
    stty echo
    clear
    printf "Quitting...\n"
    sleep .3
    clear
    exit 0
}
coords() {
    tput cup 3 0;
    display=$(echo "$1 - 5" | bc)
    printf "Cusor coordinates: $display,$2     "
}
clear
sleep .2
echo "Welcome to the terminal recreation of Conway's
  ____    _    __  __ _____    ___  _____   _     ___ _____ _____ 
 / ___|  / \  |  \/  | ____|  / _ \|  ___| | |   |_ _|  ___| ____|
| |  _  / _ \ | |\/| |  _|   | | | | |_    | |    | || |_  |  _|  
| |_| |/ ___ \| |  | | |___  | |_| |  _|   | |___ | ||  _| | |___ 
 \____/_/   \_\_|  |_|_____|  \___/|_|     |_____|___|_|   |_____|"

printf "\nPress any key to continue."
read -r -sn1 t
clear

function lines() {
    for i in $(seq $(tput cols)); do printf "="; done; printf "\n"
}
lines
echo -e "Grid Size: $(echo "$(tput lines) - 5" | bc) x $(tput cols)\t\t\t'i' = place block."
echo -e "Move cursor with the arrow keys.\t'x' = remove block"
echo -e "\t\t\t\t\t's' = begin simulation"
lines

coordx=0
coordy=5

coords 5 0
tput cup 5 0

#===================================
#  Create array to be passed to c++
#+==================================
declare -a selected
selected+=( $(tput cols) $(tput lines) )
stty -echo
while true; do
    read -r -sn1 t
    case "$t" in
        A) 
            if [ $coordy -ne 5 ]; then
                ((coordy--))
            else
                tput bel
            fi
            coords $coordy $coordx
            tput cup $coordy $coordx
        ;;
        B) 
            lines=$(tput lines | tr -d ' ') 
            if [ $coordy -ne $lines ]; then
                ((coordy++)) 
            else
                tput bel
            fi
            coords $coordy $coordx
            tput cup $coordy $coordx
        ;;
        C)
            cols=$(tput cols | tr -d ' ') 
            if [ $coordx -ne $cols ]; then
                ((coordx++))
            else
                tput bel
            fi
            coords $coordy $coordx
            tput cup $coordy $coordx
        ;;
        D) 
            
            if [ $coordx -ne 0 ]; then
                ((coordx--))
            else 
                tput bel
            fi
            coords $coordy $coordx
            tput cup $coordy $coordx
        ;;
        s)
            clear
            echo ${selected[@]}
        ;;
        i)
            printf "█"
            tput cup $coordy $coordx
            coordry=$(echo "$coordy - 5" | bc)
            selected+=("${coordry}_${coordx}")
        ;;
        x)
            printf " "
            tput cup $coordy $coordx
            coordry=$(echo "$coordy - 5" | bc)
            delete=("${coordry}_${coordx}")
            selected=( "${selected[@]/$delete}" )
        ;;
        q)
            ctrl_c
    esac
done
clear
stty echo
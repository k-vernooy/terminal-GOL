#!/bin/bash

#=====================================
# Add function for quit - restore stty
#=====================================
trap ctrl_c INT

function ctrl_c() {
    stty echo
    printf "\nQuitting...\n"
    sleep .3
    clear
    exit 0
}

coords() {
    tput cup 3 0;
    display=$(echo "$1 - 5" | bc)
    printf "Cusor coordinates: $display,$2     "
}

#=====================================
# Start screen for basic ui
#=====================================

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

#===================================================
#  Function for drawing lines across entire screen
#+==================================================
function lines() {
    for i in $(seq $(tput cols)); do printf "="; done; printf "\n"
}

#========================
#  Create top screen ui
#+=======================
lines
echo -e "Grid Size: $(tput lines) x $(tput cols)\t\t\t'i' = place block."
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
            printf "gots to start!!!"

            break
        ;;
        i)
            printf "█"
            tput cup $coordy $coordx
        ;;
        x)
            printf " "
            tput cup $coordy $coordx
        ;;
        q)
            printf "\nQuitting...\n"
            sleep .3
            stty echo
            clear
            exit 0
    esac
done
clear

stty echo
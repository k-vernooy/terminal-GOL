#!/bin/bash

coords() {
    tput cup 3 0;
    printf "Cusor coordinates: $1 $2     "
}

clear
sleep .2

echo "Welcome to the terminal recreation of Conway's
  ____    _    __  __ _____    ___  _____   _     ___ _____ _____ 
 / ___|  / \  |  \/  | ____|  / _ \|  ___| | |   |_ _|  ___| ____|
| |  _  / _ \ | |\/| |  _|   | | | | |_    | |    | || |_  |  _|  
| |_| |/ ___ \| |  | | |___  | |_| |  _|   | |___ | ||  _| | |___ 
 \____/_/   \_\_|  |_|_____|  \___/|_|     |_____|___|_|   |_____|"

sleep 2
printf "\nPress any key to continue."
read -r -sn1 t
clear

clear
stty -echo
declare -a selected

selected+=($(tput cols) $(tput lines))

for i in $(seq $(tput cols)); do printf "="; done

echo -e "Grid Size: ${selected[1]} x ${selected[0]}\t\t\t'i' = place block."
echo -e "Move cursor with the arrow keys.\t'x' = remove block"

echo -e "\t\t\t\t\t's' = begin simulation"
for i in $(seq $(tput cols)); do printf "="; done; printf "\n"

coordx=0
coordy=5
coords 0 0
tput cup 5 0
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
            clear
            exit 0
    esac
done
clear

stty echo
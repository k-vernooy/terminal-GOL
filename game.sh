#!/bin/bash

trap ctrl_c INT
function ctrl_c() {
    stty echo
    # clear
    # printf "Quitting...\n"
    # sleep .3
    # clear
    exit 0
}
function lines() {
    for i in $(seq $(tput cols)); do printf "="; done; printf "\n"
}
coords() {
    tput cup 3 0;
    display=$(echo "$1 - 5" | bc)
    printf "Cusor coordinates: $display,$2     "
}
draw() {
    for i; do
        y=${i%_*}
        x=${i#*_}
        printf '\e[%d;%dH█' "$(( y + 6 ))" "$(( x + 1 ))"
    done
}
loop(){
    clear
    # lines
    # frameNum=1
    # echo -e "Grid Size: $(echo "$(tput lines) - 5" | bc) x $(tput cols)"
    # echo -e "Frame $frameNum"
    # echo -e ""
    # lines
    # tput cup 0 0
    # echo "HAIOHDIOG"
    # draw ${selected[@]};
    new="${selected[@]}"
    # new="1_1 1_4"
    tput 0 0;
    while true; do
        # draw the next iteration
        draw $new
        sleep .05
        tput cup 0 0;
        clear
        new=$(echo "$new" | tr ' ' '\n' | grep . | tr '\n' ' ')
        echo "$new"
        # draw "$new"
        # echo "running ./iterCalc \"$new\""
        new=$(./iterCalc $new)
    done
    sleep 10000
}
clear
# sleep .2
# echo "Welcome to the terminal recreation of Conway's
#   ____    _    __  __ _____    ___  _____   _     ___ _____ _____ 
#  / ___|  / \  |  \/  | ____|  / _ \|  ___| | |   |_ _|  ___| ____|
# | |  _  / _ \ | |\/| |  _|   | | | | |_    | |    | || |_  |  _|  
# | |_| |/ ___ \| |  | | |___  | |_| |  _|   | |___ | ||  _| | |___ 
#  \____/_/   \_\_|  |_|_____|  \___/|_|     |_____|___|_|   |_____|"
# printf "\nPress any key to continue."
# read -r -sn1 t
# clear
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
            loop && break
            
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
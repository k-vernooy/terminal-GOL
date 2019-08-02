#!/bin/bash

    # clear
    # sleep .2

    # echo "Welcome to the terminal recreation of Conway's
    #   ____    _    __  __ _____    ___  _____   _     ___ _____ _____ 
    #  / ___|  / \  |  \/  | ____|  / _ \|  ___| | |   |_ _|  ___| ____|
    # | |  _  / _ \ | |\/| |  _|   | | | | |_    | |    | || |_  |  _|  
    # | |_| |/ ___ \| |  | | |___  | |_| |  _|   | |___ | ||  _| | |___ 
    #  \____/_/   \_\_|  |_|_____|  \___/|_|     |_____|___|_|   |_____|"

    # sleep 2
    # printf "\nPress any key to continue."
    # read -r -sn1 t
    # clear

    # echo -e "Move cursor with the arrow keys.\n
    # 'i' = place block.
    # 'x' = remove block 
    # 's' = begin simulation"

    # sleep 2
    # printf "\nPress any key to begin."
    # read -r -sn1 t
    # clear

coordx=0
coordy=0

while true; do
    read -r -sn1 t
    case $t in
        A) 
            clear
            ((coordy++)) 
            echo "$coordx,$coordy"            
        ;;
        B) 
            clear
            ((coordy--))
            echo "$coordx,$coordy"
        ;;
        C) 
            clear
            ((coordx++))
            echo "$coordx,$coordy"
        ;;
        D) 
            clear
            ((coordx--))
            echo "$coordx,$coordy"
        ;;
        q)
            printf "\nQuitting...\n"
            sleep .3
            clear
            exit 0
    esac
done
clear
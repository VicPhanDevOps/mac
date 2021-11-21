#!/bin/bash

# disable apps downloaded from anywhere on Mac

check_os_for_mac() {

    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi 
}

disable_apps_downloaded_from_anywhere() {
    printf "\nDisable apps downloaded from anywhere on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started disabling apps downloaded from anywhere at $(date)"

    sudo spctl --master-enable 

    echo "------------------------------------------------------------------"
    echo "Expand Apple menu and select \"System Preferences...\""
    read -p "Press any key to continue:"
    echo ""
    
    echo "Select \"Security & Privacy.\""
    read -p "Press any key to continue:"
    echo ""

    echo "Select \"General\" tab and you will see \"Anywhere\" option under \"Allow apps downloaded from:\" list now."
    read -p "Press any key to continue:"
    echo ""

    echo "Select the lock icon and log in with your credentials."
    read -p "Press any key to continue:"
    echo ""
    
    echo "You won't see \"Anywhere\" option under \"Allow apps downloaded from:\" list anymore."
    read -p "Press any key to continue:"
    echo "------------------------------------------------------------------"

    end=$(date +%s)
    echo "Finished disabling apps downloaded from anywhere at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

disable_apps_downloaded_from_anywhere

#!/bin/bash

# get Bonjour name on Mac

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo -e "Operating System:\n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""

        exit 1
    fi
}

get_bonjour_name() {
    printf "\nGet Bonjour name on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started getting Bonjour name at $(date)"

    bonjourName=$(scutil --get LocalHostName)
    echo "The Bonjour name is: $bonjourName"
    tput setaf 2; echo "Successsfully got Bonjour name."; tput sgr0

    end=$(date +%s)
    echo "Finished getting Bonjour name at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

get_bonjour_name

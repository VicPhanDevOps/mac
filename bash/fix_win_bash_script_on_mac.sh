#!/bin/bash

# fix Windows Bash script on Mac

# you can run this script with: ./fix_win_bash_script_on_mac.sh < script name > 

bashScript=$1 # you can set the script name here

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

get_bash_script() {
    if [ -z $bashScript ]; then
        read -p "Please type the script name and press \"return\" key (Example: test.sh):" bashScript

        echo ""
    else 
        echo $bashScript &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameter(s) at $(date)"
    valid="true"

    echo "Parameter(s):"
    echo "-----------------------"
    echo "bashScript: $bashScript"
    echo "-----------------------"

    if [ -z $bashScript ]; then
        tput setaf 1; echo "bashScript is not set."; tput sgr0
        valid="false"
    fi

    if [ $valid == "true" ]; then 
        tput setaf 2; echo "All parameter check(s) passed."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""
    else 
        tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0

        echo "Finished checking parameter(s) at $(date)"
        echo ""

        exit 1
    fi
}

prompt_run_script() {
    echo "Would you like to run the script now?"
    read -p "Please type \"Y\" or \"N\" and press \"return\" key: " answer

    if [[ $answer = 'Y' || 'y' ]]; then 
        echo "Started running script at $(date)"
        echo "----------------------------------"
        ./$bashScript
        echo "----------------------------------"
        echo "Finished running script at $(date)"
        echo ""
    fi
}

fix_win_bash_script() {
    printf "\nFix Windows Bash Script on Mac.\n\n"
    check_os_for_mac

    get_bash_script
    check_parameters

    start=$(date +%s)
    echo "Started fixing Windows Bash script at $(date)"

    sed -i -e 's/\r$//' $bashScript
    junkFile="$bashScript-e"
    rm $junkFile
    prompt_run_script

    end=$(date +%s)
    echo "Finished fixing Windows Bash script at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

fix_win_bash_script

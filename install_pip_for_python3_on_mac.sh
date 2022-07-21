#!/bin/bash

# install PIP for Python 3 on Mac

check_os_for_mac() {
    echo "Started checking operating system at $(date)"

    if [[ $OSTYPE == 'darwin'* ]]; then 
        tput setaf 2; echo "Operating System:\n$(sw_vers)"; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    else 
        tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0

        echo "Finished checking operating system at $(date)"
        echo ""
    fi
}

check_pip() {
    echo "Started checking PIP at $(date)"

    which -s pip
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "PIP is installed."; tput sgr0
        pip --version

        echo "Finished checking PIP at $(date)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "PIP is not installed."; tput sgr0

        echo "Finished checking PIP at $(date)"
        echo ""
    fi
}

check_python3() {
    echo "Started checking Python 3 at $(date)"

    which -s python3
    if [[ $? == 0 ]]; then 
        tput setaf 2; echo "Python 3 is installed."; tput sgr0
        python3 --version

        echo "Finished checking Python 3 at $(date)"
        echo ""

        exit 0
    else 
        tput setaf 1; echo "Python 3 is not installed."; tput sgr0
        
        echo "Finished checking Python 3 at $(date)"
        echo ""
    fi
}

install_pip_for_python3() {
    printf "\nInstall PIP for Python 3 on Mac.\n\n"
    
    check_os_for_mac
    check_pip
    check_python3

    start=$(date +%s)
    echo "Started installing PIP at $(date)"

    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py
    pip --version

    end=$(date +%s)
    echo "Finished installing PIP at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

install_pip_for_python3

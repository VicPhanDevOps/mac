#!/bin/bash

# add printer on Mac

# you can run this script with: ./add_printer_on_mac.sh < printer name > < printer IP > 

printerName=$1 # you can set printer name here
printerIp=$2 # you can set printer IP address here

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

get_printer_name() {
    if [ -z $printerName ]; then 
        read -p "Please type the printer name and press \"return\" key (Example: IT): " printerName
        
        echo ""
    else 
        echo $printerName &>/dev/null
    fi
}

get_printer_ip() {
    if  [ -z $printerIp]; then 
        read -p "Please type the IP address of the printer and press \"return\" key (Example: 10.10.6.144): " printerIp
        
        echo ""
    else
        echo $printerIp &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameter(s) at $(date)"
    valid="true"

    echo "Parameter(s):"
    echo "--------------------------"
    echo "printerName: $printerName"
    echo "printerIp  : $printerIp"
    echo "--------------------------"

    if [ -z $printerName ]; then 
        tput setaf 1; echo "printerName is not set."; tput sgr0
        valid="false"
    fi

    if [ -z $printerIp ]; then 
        tput setaf 1; echo "printerIp is not set."; tput sgr0
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

add_printer() {
    printf "\nAdd printer on Mac.\n"
    check_os_for_mac

    echo "The printer(s) on this Mac are: "
    lpstat -p
    echo ""

    get_printer_name
    get_printer_ip
    check_parameters
    
    start=$(date +%s)
    echo "Started adding printer at $(date)"

    /usr/sbin/lpadmin -p $printerName -E -v lpd://$printerIp/$printerName -D $printerName -P /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Versions/A/Resources/Generic.ppd 

    tput setaf 2; echo "Successfully added printer."; tput sgr0
    echo ""
    
    echo "The printer(s) on this Mac are: "
    lpstat -p
    echo ""

    end=$(date +%s)
    echo "Finished adding printer at $(date)"

    duration=$(( $end - $start))
    echo "Total execution time: $duration second(s)"
    echo ""
}

add_printer

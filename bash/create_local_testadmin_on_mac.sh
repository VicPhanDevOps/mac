#!/bin/bash
set -e 

# create local test admin on Mac

# you can run this script with: ./create_local_testadmin_on_mac.sh < test admin > < unique ID > < password > 

localAdmin="TEST"
uniqueId="1002"
password="TEST"

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

get_local_admin() {
    if [ -z $localAdmin ]; then 
        read -p "Please type the local admin name and press \"return\" key (Example: TEST): " localAdmin
    
        echo ""
    else
        echo $localAdmin &>/dev/null
    fi
}

get_unique_id() {
    if [ -z $uniqueId ]; then 
        read -p "Please type the unique ID and press \"return\" key (Example: 1001): " uniqueId

        echo ""
    else 
        echo $uniqueId &>/dev/null
    fi
}

get_password() {
    if [ -z $password ]; then 
        read -s "Please type the password and press \"return\" key (Example: TEST): "

        echo ""
    else 
        echo $password &>/dev/null
    fi
}

check_parameters() {
    echo "Started checking parameter(s) at $(date)"
    valid="true"

    echo "Parameter(s):"
    echo "-----------------------"
    echo "localAdmin: $localAdmin"
    echo "uniqueId  : $uniqueId"
    echo "password  : ***"
    echo "-----------------------"

    if [ -z $localAdmin ]; then 
        tput setaf 1; echo "localAdmin is not set."; tput sgr0
        valid="false"
    fi

    if [ -z $uniqueId ]; then 
        tput setaf 1; echo "uniqueId is not set."; tput sgr0
        valid="false"
    fi

    if [ -z $password ]; then
        tput setaf 1; echo "password is not set."; tput sgr0
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

# define main function
createLocalTestAdmin() {
    printf "\nCreate test admin on Mac.\n\n"
    check_os_for_mac

    get_local_admin
    get_unique_id
    get_password
    check_parameters

    start=$(date +%s)
    echo "Started creating test admin at $(date)"

    # create username
    dscl . -create /Users/$localAdmin UserShell /bin/bash
    dscl . -create /Users/$localAdmin RealName $localAdmin

    # create unique ID
    dscl . -create /Users/$localAdmin uniqueId $uniqueId

    # create primary group
    dscl . -create /Users/$localAdmin PrimaryGroupID 1000

    # create home folder
    dscl . -create /Users/$localAdmin NFSHomeDirectory /Local/Users/username

    # create password
    dscl . -passwd /Users/$localAdmin $password

    # grant admin rights
    dscl . -append /Groups/admin GroupMembership $localAdmin

    # check if local admin has been created
    dscl . list /Users | grep -v '_'

    tput setaf 2; echo "Successfully created test admin account."; tput sgr0
    
    end=$(date +%s)
    echo "Finished creating test admin at $(date)"

    duration=$(( $end - $start ))
    echo "Total execution time: $duration second(s)"
    echo ""
}

# call main function
createLocalTestAdmin

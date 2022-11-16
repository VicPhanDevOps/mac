#!/bin/python

# check yes on Mac and Linux

import colorama, os, sys, subprocess, traceback
from colorama import Fore, Style
from datetime import datetime
colorama.init()


def checkOsForMac():
    print("Started checking operating system at", datetime.now().strftime("%Y-%m-%d %H:%M %p"))

    if sys.platform == "darwin": 
        print(Fore.GREEN + "Operating System: ")
        os.system('sw_vers')
        print(Style.RESET_ALL, end="")
        
    elif sys.platfrom == "linux": 
        print(Fore.GREEN + "Operating System: ")
        os.system('uname -r')
        print(Style.RESET_ALL, enc="")

    else: 
        print(Fore.RED + "Sorry but this script only runs on Mac." + Style.RESET_ALL)
        
        print("Finished checking operating system at", datetime.now().strftime("%Y-%m-%d %H:%M %p"))

        exit("")

    print("Finished checking operating system at", datetime.now().strftime("%Y-%m-%d %H:%M %p"))

    print("")


def checkYes(): 
    print("\nCheck yes on Mac.\n")
    checkOsForMac()

    try:
        startDateTime = datetime.now()
        
        print("Started checking yes at", startDateTime.strftime("%Y-%m-%d %H:%M %p"))

        FNULL = open(os.devnull,  'w')

        checkAnsibleOnMacOrLinux = subprocess.call(['which', 'yes'], stdout=FNULL) 

        if checkAnsibleOnMacOrLinux == 0:
            print(Fore.GREEN + "yes is installed."+ Style.RESET_ALL)
            print(Fore.GREEN + "Successfully checked yes." + Style.RESET_ALL)

            finishedDateTime = datetime.now()

            print("Finished checking yes at", finishedDateTime.strftime("%Y-%m-%d %H:%M %p"))

            duration = finishedDateTime - startDateTime
            print("Total execution time: {0} second(s)".format(duration.seconds))
            print("")

        else: 
            print(Fore.RED + "yes is not installed." + Style.RESET_ALL)
            
            finishedDateTime = datetime.now()

            print("Finished checking yes at", finishedDateTime.strftime("%Y-%m-%d %H:%M %p"))

            duration = finishedDateTime - startDateTime
            print("Total execution time: {0} second(s)".format(duration.seconds))
            exit("")
        
    except Exception as e: 
        print(Fore.RED + "Failed to check yes.")
        print(e)
        print(traceback.print_stack)
        exit("" + Style.RESET_ALL)
        

checkYes()
#!/bin/python

# count characters in last name

# you can run this script with: python3 countCharLastNameInPython.py < last name > 

import traceback
import colorama, os, sys
from colorama import Fore, Style
from datetime import datetime
colorama.init()


def checkOs():
    print("Started checking operating system at", datetime.now().strftime("%Y-%m-%d %H:%M %p"))

    if sys.platform == "win32": 
        print(Fore.GREEN + "Operating System: ", end="")
        os.system('ver')
        print(Style.RESET_ALL, end="")
        operatingSystem = "Windows"

    elif sys.platform == "darwin": 
        print(Fore.GREEN + "Operating System: ")
        os.system('sw_vers')
        print(Style.RESET_ALL, end="")
        operatingSystem = "macOS"

    elif sys.platform == "linux": 
        print(Fore.GREEN + "Operating System: ")
        os.system('uname -r')
        print(Style.RESET_ALL, end="")
        operatingSystem = "Linux"

    print("")
    return operatingSystem


def getLastName(operatingSystem): 
    if operatingSystem == "Windows": 
        lastName = str(input("Please type your last name and press \"Enter\" key (Example: Phan): "))

        print("")

    elif operatingSystem == "macOS" or operatingSystem == "Linux": 
        lastName = str(input("Please type your last name and press \"return\" key (Example: Phan): "))

        print("")

    return lastName

    
def checkParameters(lastName): 
    print("Started checking parameters at", datetime.now().strftime("%Y-%m-%d %H:%M %p"))

    valid = "true"

    print("Parameters:")
    print("------------------------------")
    print("lastName: {0}".format(lastName))
    print("------------------------------")

    if lastName == None: 
        print(Fore.RED + "lastName is not set." + Style.RESET_ALL)
        valid = "false"
    
    if valid == "true": 
        print(Fore.GREEN + "All parameter checks passed." + Style.RESET_ALL)
        
        print("Finished checking parameters at", datetime.now().strftime("%Y-%m-%d %H:%M %p"))

        print("")

    else: 
        print(Fore.RED + "One or more parameters are incorrect" + Style.RESET_ALL)

        print("Finished checking parameters at", datetime.now().strftime("%Y-%m-%d %H:%M %p"))

        exit("")


def countCharactersInLastName(): 
    print("\nCount characters in last name in Python.\n")
    operatingSystem = checkOs()

    if len(sys.argv) >= 2: 
        lastName = str(sys.argv[1])
    else: 
        lastName = getLastName(operatingSystem)

    checkParameters(lastName)

    try: 
        startDateTime = datetime.now()
        
        print("Started counting characters in last name at", startDateTime.strftime("%Y-%m-%d %H:%M %p"))

        count = len(lastName)
        print(Fore.BLUE + "{0} has {1} characters in it.".format(lastName, count))
        
        print(Fore.GREEN + "Successfully counted characters in last name." + Style.RESET_ALL)

        finishedDateTime = datetime.now()

        print("Finished counting characters in last name at", finishedDateTime.strftime("%Y-%m-%d %H:%M %p"))

        duration = finishedDateTime - startDateTime
        print("Total execution time: {0} second(s)".format(duration.seconds))
        print("")
        
    except Exception as e: 
        print(Fore.RED + "Failed to count characters in last name.")
        print(e)
        print(traceback.print_stack)
        exit("" + Style.RESET_ALL)


countCharactersInLastName()

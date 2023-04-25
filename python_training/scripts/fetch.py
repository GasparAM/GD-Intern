#!/usr/bin/env python3
# Write a script that gets system information like distro info, memory(total, used, free), 
# CPU info (model, core numbers, speed), current user, system load average, and IP address. 
# Use arguments for specifying resources. (For example, -d for distro -m for memory, -c for CPU,
#  -u for user info, -l for load average, -i for IP address).

import socket
import sys
import re
import subprocess

for i in sys.argv:
    match i:
        case "-c":
            print("CPU:", subprocess.getoutput("cat /proc/cpuinfo | grep -m 1 'model name'"))
        case "-d":
            # Not gonna work on macOS
            inf = open("/etc/os-release").readlines()
            for i in inf:
                # print(i)
                if re.search('PRETTY_NAME', i):
                    print("The Distribution is:", i.split('"')[-2])
        case "-m":
            print("Memory total:", subprocess.getoutput("free -h | grep Mem | tr -s ' '").split(' ')[1])
            print("Memory used:", subprocess.getoutput("free -h | grep Mem | tr -s ' '").split(' ')[2])
            print("Memory free:", subprocess.getoutput("free -h | grep Mem | tr -s ' '").split(' ')[3])
        case "-u":
            print("Current user:", subprocess.getoutput("whoami"))
        case "-l":
            print("Load average:", open("/proc/loadavg").read())
        case "-i":
            print("Internal IP:", socket.gethostbyname(socket.gethostname()))
        case "-h":
            print("""A fetch script for getting system information written in Python 3.11 
            \nUsage: 
            \n-c     Prints CPU info 
            \n-d     Prints distribution 
            \n-m     Prints memory info 
            \n-u     Prints current user
            \n-l     Prints load average
            \n-i     Prints internal IP
            \n-h     Prints this menu
            """)
        case _:
            print("Use -h to see the usage menu")


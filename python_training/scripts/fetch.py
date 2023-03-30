# Write a script that gets system information like distro info, memory(total, used, free), 
# CPU info (model, core numbers, speed), current user, system load average, and IP address. 
# Use arguments for specifying resources. (For example, -d for distro -m for memory, -c for CPU,
#  -u for user info, -l for load average, -i for IP address).

import os
import sys
import re
import subprocess

for i in sys.argv:
    match i:
        case "-c":
            print("cpu info")
        case "-d":
            # Not gonna work on macOS
            inf = open("/etc/os-release").readlines()
            for i in inf:
                # print(i)
                if re.search('PRETTY_NAME', i):
                    print("The Distribution is:", i.split('"')[-2])
        case "-m":
            print("mem")
        case "-u":
            print("Current user:", subprocess.getoutput("whoami"))
        case "-l":
            print("Load average:", open("/proc/loadavg").read())
        case "-i":
            print("ip")


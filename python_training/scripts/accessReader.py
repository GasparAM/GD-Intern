# Create a script that reads the access log from a file. The name of the file is provided as an argument. 
# An output of the script should provide the total number of different User Agents and 
# then provide statistics with the number of requests from each of them.

import sys

file = open(sys.argv[len(sys.argv) - 1]).readlines()
dict = {}

def readLog():
    for i in file:
        try:
            dict[i.split('"')[-2]] += 1
        except:
            dict[i.split('"')[-2]] = 1
    for i in dict:
        print(dict[i], "   ", i)

readLog()
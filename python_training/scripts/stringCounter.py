#!/usr/bin/env python3
# Given an input string, count occurrences of all characters within a string 
# (e.g. pythonnohtyppy -> p:3, y:3, t:2, h:2, o:2, n:2).

def count():
    dict = {}
    text = input("Please provide the input string: ")
    for i in text:
        try:
            dict[i] += 1
        except:
            dict[i] = 1
    print(dict)

count()
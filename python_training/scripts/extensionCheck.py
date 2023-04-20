#!/usr/bin/env python3
# Create a script that accepts the file name and puts its extension to output. 
# If there is no extension - an exception should be raised.
import sys
import os

def return_extension():
    file = sys.argv[len(sys.argv) - 1]
    if os.path.isfile(file):
        extension = os.path.basename(file).split(".", -1)
        size = len(extension)
        if size < 2:
            raise Exception("Please provide a file that has an extension")
        else:
            extension = extension[size - 1]
            print(f"The provided file of {file} has an extension of .{extension}")
    else:
        raise Exception(f"There is no such file {file}")

return_extension()
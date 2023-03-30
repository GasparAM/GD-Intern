# Create a script that accepts the file name and puts its extension to output. 
# If there is no extension - an exception should be raised.
import sys
import os

def return_extension():
    file = sys.argv[len(sys.argv) - 1]
    if os.path.isfile(file):
        file = sys.argv[len(sys.argv) - 1]
        extension = file.split(".", -1)
        if len(extension) < 2:
            raise Exception("Please provide a file that has an extension")
        else:
            extension = extension[len(extension) - 1]
            print(f"The provided file of {file} has an extension of .{extension}")



return_extension()
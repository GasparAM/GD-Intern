## The following scripts were written as training exercises in scope of 2023 Grid Dynamics DevOps Internship

# 

## BASH TRAINING

Theese scripts were written to be used with Linux and Bash. Though most of them work on MacOS, that's not the focus of theese exercises.

**caesar.sh** - Given an input string and a shift number the script encrypts the given string into the caesar cypher

**caesarV2.sh** - The same as above but much cleaner

**fetch.sh** - A script that returns information about the system 

**fib.sh** - A simple script that returns the number in the fibbonacci progression based on the positional argument

**fizz.sh** - A script that goes from 0 to 100, prints Fizz if the given number is divisible by 3, Buzz if the given number is divisible by 5 and FizzBuzz if the given number is divisible by both 3 and 5.

**opts.sh** - A script that accepts the numbers and the operators via arguments passed from the CLI. *Please use quotes for the operands and the numbers*

**textTrickery.sh** - Given some text as an input file, do various operations depending on the argument passed. *The command must contain an input file and an output file* 

#
## PYTHON TRAINING

### These scripts were written in Python 3.11. Compatibility with older versions is not guaranteed. The scripts are meant to be run like this:

> python3 <script_name> <optional_arguments> 

**accessReader.py** - Given a generic access log as a CLI argument, the script counts how many times the entry appears in the access log. The entries are counted by using the user agents. The sample access log can be found in ./python_training/scripts/test_files/

**dupRem.py** - A script that removes duplicates in an array. The values are written inside the script.

**extensionCheck.py** - A script that accepts a file as an input and returns the extension of the file. If the file has no extension an exception is raised. A sample file with no extension can be found in ./python_training/scripts/test_files/

**fetch.py** - Returns information about the system. Uses CLI flags *(fetch.py -h for help)*

**stringCounter.py** - A script that asks the user for input and returns a dictionary with the symbols and how many times those symbols where encountered in the input string
#
## SurveyMonkey

The folder surveymonkey contains a script which takes a json file and through API requests creates a survey on https://www.surveymonkey.com


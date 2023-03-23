#!/bin/bash
# Write caesar cipher script accepting three parameters -s <shift> -i <input file> -o <output file>

opts='s:i:o:'

cipher () {
    alphabet=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
    tr "A-Z" "${alphabet[$SHIFTNUM]}-ZA-${alphabet[$SHIFTNUM]}" < $INPUT_FILE > $OUTPUT_FILE 
}

while getopts $opts arg; do
    case "${arg}" in
        s)
            SHIFTNUM=$OPTARG
            ;;
        i)
            INPUT_FILE=$OPTARG
            ;;
        o)
            OUTPUT_FILE=$OPTARG
            ;;
    esac
done

cipher
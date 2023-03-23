#!/bin/bash
# Write caesar cipher script accepting three parameters -s <shift> -i <input file> -o <output file>

opts='s:i:o:'

cipher () {
    alphabet=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
    caesar=()
    for ((i=0; i<26; i++)); do 
        if [ $(($i + $SHIFTNUM)) -le 25 ]; then
            caesar[i]="${alphabet[i + $SHIFTNUM]}"
        else
            caesar[i]="${alphabet[i + ${SHIFTNUM} - 26]}"
        fi
        echo "${alphabet[i]}"
        echo "${caesar[@]}"
    done
    sed "y/$(echo ${alphabet[@]} | tr -d ' ')$(echo ${alphabet[@]} | tr -d ' ' | awk '{print tolower()}')/$(echo ${caesar[@]} | tr -d ' ')$(echo ${caesar[@]} | tr -d ' ' | awk '{print tolower()}')/" $INPUT_FILE > $OUTPUT_FILE
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
#!/bin/bash

opts="o:n:d"

doTheMath () {
    WRKRND=1
    NUM=$(echo ${OPTARG} | awk '{print $1}')
    echo $OPTARG
    for i in $OPTARG; do
        #Workaround to skip the first loop
        if [[ $WRKRND == 1 ]]; then
            WRKRND=2
        else
            let "NUM = ${NUM} ${OP} ${i}"
        fi
    done
}

displayInfo (){
    echo "User: ${USER}"
    echo "Script: ${0}"
    echo "Operation: ${OP}"
}

while getopts $opts arg; do
    case "${arg}" in
        o)
            OP=$OPTARG
            # echo $OP
            ;;
        n)
            doTheMath
            # echo $NUM
            # echo $@
            # echo $OPTARG
            ;;
        d)
            displayInfo
            ;;
    esac
done

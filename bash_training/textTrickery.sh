#!/bin/bash
# Write script with following functionality:

#     If -v tag is passed, replaces lowercase characters with uppercase and vise versa
#    DONE   If -s is passed, script substitutes <A_WORD> with <B_WORD> in text (case sensitive)
#     If -r is passed, script reverses text lines
#    DONE   If -l is passed, script converts all the text to lower case
#    DONE   If -u is passed, script converts all the text to upper case
#    DONE   Script should work with -i <input file> -o <output file> tags
opts="vs:r:lui:o:"

replace_word () {
    A_WORD=$(echo $OPTARG | awk '{print $1}')
    B_WORD=$(echo $OPTARG | awk '{print $2}')
    sed "s/$A_WORD/$B_WORD/g" $INPUT_FILE > $OUTPUT_FILE
}

to_lowercase () {
    awk '{print tolower()}' $INPUT_FILE > $OUTPUT_FILE
}

to_uppercase () {
    awk '{print toupper()}' $INPUT_FILE > $OUTPUT_FILE
}

reverse_string () {
    rev $INPUT_FILE > $OUTPUT_FILE
}

lowUp_upLow (){
    #The following was written in such a horrible way to keep compatibility with macOS sed instead of only working with GNU sed
    sed 'y/abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz/' $INPUT_FILE > $OUTPUT_FILE
    #A prettier approch that works with GNU sed
    #sed 's/[A-Z][a-z]/[a-z][A-Z]/g' $INPUT_FILE > $OUTPUT FILE
}

while getopts $opts arg; do
    case "${arg}" in
        v)
            lowUp_upLow            
            ;;
        s)
            replace_word
            ;;
        r)
            reverse_string
            ;;
        l)
            to_lowercase
            ;;
        u)
            to_uppercase
            ;;
        i)
            INPUT_FILE=$OPTARG
            ;;
        o)
            OUTPUT_FILE=$OPTARG
            ;;
    esac
done
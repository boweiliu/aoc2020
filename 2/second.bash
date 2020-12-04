#!/bin/bash


main() {
    read nums
    read char
    char="$(echo $char | cut -d: -f1)"
    read line
    i1="$(echo "$nums" | cut -d- -f1)"
    i2="$(echo "$nums" | cut -d- -f2)"
    line=" $line"
    pos1="$(echo "${line:$i1:1}")"
    pos2="$(echo "${line:$i2:1}")"

    if [ "$pos1" = "$char" ] && ! [ "$pos2" = "$char" ] ; then
        echo "$nums $line $char $pos1 $pos2"
    elif ! [ "$pos1" = "$char" ] && [ "$pos2" = "$char" ] ; then
        echo "$nums $line $char $pos1 $pos2"
    else
        echo "NO: $nums $line $char $pos1 $pos2" > /dev/stderr
    fi
    #if [ "$ln" -le "$(echo "$nums" | cut -d- -f2)" ] && [ "$ln" -ge "$(echo "$nums" | cut -d- -f1)" ] ; then
    #    echo "$nums $char $line $ln"
    #else
    #    echo "NO: $nums $char $line $ln" > /dev/stderr
    #fi
}


cat input | while read line ; do 
echo "$line" | tr ' ' '\n' | main ;
done | wc -l


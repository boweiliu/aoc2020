#!/bin/bash


main() {
    read nums
    read char
    char="$(echo $char | cut -d: -f1)"
    read line
    ln="$(echo "$line" | sed "s/[^${char}]//g" | tr -d '\n' | wc -c)"

    #echo "$line" | sed "s/[^${char}]//g"
    if [ "$ln" -le "$(echo "$nums" | cut -d- -f2)" ] && [ "$ln" -ge "$(echo "$nums" | cut -d- -f1)" ] ; then
        echo "$nums $char $line $ln"
    else
        echo "NO: $nums $char $line $ln" > /dev/stderr
    fi
}


cat input | while read line ; do 
echo "$line" | tr ' ' '\n' | main ;
done | wc -l


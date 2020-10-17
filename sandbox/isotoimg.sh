#!/bin/bash

if [ $# -ne 2 ]; then
    echo Two and ONLY two arguments please:
    echo The ISO file and the device that you want to write to.
fi

for _ARG in $@; do
    if [[ $_ARG == *".iso"* ]]; then
        _ISO_TO_WRITE=$( echo "$_ARG" )
        #echo $_ISO_TO_WRITE
    else
        _WRITE_TO_DISK=$( echo "$_ARG" )
        echo $_WRITE_TO_DISK
    fi
done

#echo Writing image $ISO_TO_WRITE to ${_WRITE_TO_DISK}.

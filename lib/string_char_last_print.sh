#!/bin/bash

# this script returns the last char of a string

function _string_char_last_print () {
    if [ "$#" -gt "1" ]; then
        echo "\nThis script takes only one argument.\n"
        exit 1
    fi
    
    _STRING=$1
    _I=$(( ${#_STRING} -1 ))
    
    echo "${_STRING:$_I:1}"
}

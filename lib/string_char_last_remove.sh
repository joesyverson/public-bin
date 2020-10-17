#!/bin/bash

# this script removes a substring from a string if it is a substring

function _string_char_last_remove () {
    _STRING="$1"
    _SUBSTRING_TO_REMOVE="$2"
    
    echo $_STRING

    echo "${_STRING%$_SUBSTRING_TO_REMOVE}"
}

#!/bin/bash

function _file_extension_remove () {
    if [ "$#" -gt "1" ]; then echo Only one argument allowed per call.; exit; fi

    _FILE=$1
    echo $_FILE | awk -F "." '{print $1}'
}

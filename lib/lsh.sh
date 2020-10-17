#/bin/bash

# lists dot files in a directory

function _lsh () {
    if [ "$#" -eq "0" ]; then
        ls -1 .[!.]?*
    elif [ "$#" -gt "1" ]; then
        echo "\nYou may specify only one directory at a time.\n"
    else
        _DIRECTORY=${1%/}
        ls -1 ${_DIRECTORY}/.[!.]?*
    fi
}


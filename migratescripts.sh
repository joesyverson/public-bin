#!/bin/bash

# this script migrates scripts from the current directory to
### the user's home bin directory
# possible expansion includes an argument of the directory
### to copy to

_LIB_ROOT=./lib
source $_LIB_ROOT/line_match_remove.sh
source $_LIB_ROOT/line_match_exact_replace.sh
source $_LIB_ROOT/file_extension_remove.sh

if [ ! -d ~/Bin/ ]; then
    mkdir ~/Bin/
fi

echo
for _SCRIPT in $( ls -1 $_LIB_ROOT ); do
    if [[ $(echo $_SCRIPT) == *.sh ]]; then
        _COMMAND_FROM_SCRIPT=$( _file_extension_remove $_SCRIPT)

        echo Copying $_SCRIPT to $HOME/Bin/$_COMMAND_FROM_SCRIPT
        
        cp $_LIB_ROOT/$_SCRIPT ~/Bin/$_COMMAND_FROM_SCRIPT
        
        # extract script from function
        _line_match_remove 'function' "${HOME}/Bin/$_COMMAND_FROM_SCRIPT"
        _line_match_exact_replace '}' '' "${HOME}/Bin/$_COMMAND_FROM_SCRIPT"
        sleep 1
	fi
done
echo

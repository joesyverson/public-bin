#!/bin/bash

# this script migrates scripts from the current directory to
### the user's home bin directory
# possible expansion includes an argument of the directory
### to copy to
if [ -d ~/bin/ ]; then
	for script in $(ls .); do
		if [[ $(echo $script) == *.sh ]]; then
			command_from_script=$(echo $script | awk -F "." '{print $1}')
			cp $script ~/bin/$command_from_script
		fi
	done
else
	echo $'\n   There is no directory "/home/bin"\n'
fi

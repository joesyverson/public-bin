#!/bin/bash

# the rm command has ruined my life
# this script offers an alternative by moving files to "~/.local/share/Trash"
### instead of deleting it
### irrevocably

garbage_directory="$HOME/Garbage"

if [ -d ~/Garbage ]; then
	for file_or_directory in $@; do
		mv $file_or_directory $garbage_directory
	done
else
	mkdir "$HOME/Garbage"
	for file_or_directory in $@; do
		mv $file_or_directory $garbage_directory
	done
fi

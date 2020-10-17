#!/bin/bash

# this script uploads changes to important conf files to the repository

declare -a _CONFS='.bashrc .vimrc .gitconfig'

for _CONF in $_CONFS; do
    echo Copying ${HOME}/${_CONF} to ./conf
    
    cp ${HOME}/${_CONF} ./conf
done


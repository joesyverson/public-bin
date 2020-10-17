#!/bin/bash

# this script copies my configs to the right place 

source ./lib/lsh.sh

echo -e "\nCopying dot files to ${HOME}\n"

for _FILE in $( _lsh ./conf  ); do
    echo Copying $_FILE
    sleep 1
    cp $_FILE $HOME
done

echo
# cp $( pwd )/conf/.vimrc $HOME/
# cp $( pwd )/conf/.bashrc $HOME/
# cp $( pwd )/conf/.gitconfig $HOME/


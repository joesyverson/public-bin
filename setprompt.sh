#!/bin/bash

# red:31m
# turq:36m

echo $'\n...setting prompts for current user...'

grep -n PS1 ~/.bashrc | cut -d ":" -f1 | while IFS= read -r line_number ; do
    sed -i "${line_number}s~.*~PS1='\\\[\\\033[1;31m\\\]$ >\\\[\\\033[00m\\\] '~" ~/.bashrc;
done
sleep 1

echo $'\n...setting prompts for root...'
sudo grep -n PS1 /root/.bashrc | cut -d ":" -f1 | while IFS= read -r line_number ; do
    sudo sed -i "${line_number}s~.*~PS1='\\\[\\\033[1;31m\\\]\# >\\\[\\\033[00m\\\] '~" /root/.bashrc;
done

sleep 1

echo $'\n...done!\n'

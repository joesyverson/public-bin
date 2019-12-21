#!/bin/bash

# scripts for practice prompts in the Linux Bible



ONE=${1}
TWO=${2}
THREE=${3}

# myownscript
echo " "
echo "Today is `date`."
echo "You are in $(pwd) and your host is `hostname`."
# script2
echo " "
echo "There are ${#} parameters that include: ${@}."
echo "The first is ${ONE}, the second is ${TWO}, the third is ${THREE}."
# script3
echo " "
read -p  "Please enter the street that you grew up on: "
STREET=$REPLY
read -p "Please enter the town that you grew up in: "
TOWN=$REPLY
echo "     The street I grew up on was ${STREET} and the town was ${TOWN}."
# myos
echo " "
read -p "What's your favorite operating system? "
case $REPLY in
	"Mac" | "mac")
		echo "     Why when you can be spied on for so much cheaper?";;
	"Windows" | "windows")
		echo "     Windows is broken.";;
	"Linux" | "linux")
		echo "     Great choice!";;
	*)
		echo "     Well I just don't know what to think.";;
esac
# script5
echo " "
for animal in "moose" "cow" "goose" "sow"; do
	echo "I have a ${animal}."
done


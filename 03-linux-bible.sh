#!/bin/bash

# scripts for practice prompts in the Linux Bible

################### VARIABLES ###################

ONE=${1}
TWO=${2}
THREE=${3}

################### COMMANDS  ###################

# myownscript
echo " "
echo "Today is `date`." # interpolate date command into string
echo "You are in $(pwd) and your host is `hostname`." # interpolate commands pwd and hostname into string

# script2
echo " "
echo "There are ${#} parameters that include: ${@}." # interpolate number of args and args into string
echo "The first is ${ONE}, the second is ${TWO}, the third is ${THREE}." # interpolate the first three arguments into string

# script3
echo " "
read -p  "Please enter the street that you grew up on: " # prompt user for input
STREET=$REPLY # store input to variable
read -p "Please enter the town that you grew up in: "
TOWN=$REPLY
echo "     The street I grew up on was ${STREET} and the town was ${TOWN}."

# myos
echo " "
read -p "What's your favorite operating system? "
case $REPLY in # test cases for user input
	"Mac" | "mac") # accept capitalized and lowercase input
		echo "     Why when you can be spied on for so much cheaper?";;
	"Windows" | "windows")
		echo "     Windows is broken.";;
	"Linux" | "linux")
		echo "     Great choice!";;
	*) # catch for all input that does not match the first three cases
		echo "     Well I just don't know what to think.";;
esac

# script5
echo " "
for animal in "moose" "cow" "goose" "sow"; do # print args array in string
	echo "I have a ${animal}."
done


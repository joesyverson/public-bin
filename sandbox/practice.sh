#!/bin/bash -x

# scripts for practice prompts in the Linux Bible and Joe Collins's Youtube tutorial
# currently the concatination of two separarate scripts
### 03-linux-bible.sh
### 04-joe-collins.sh
# to be refactored into a single, continuous and DRY script

################### VARIABLES ###################

ONE=${1}
TWO=${2}
THREE=${3}

format='echo "Exit code: $?" && echo " "' # store this command to be called later like a function

################### BEGIN SCRIPT ###################
echo " "

#------------------ 01 ------------------#

# break a single line into two using back slash
echo 'hello' \
	&& echo 'world' > /dev/null # redirect second line to nowhere so it is not logged to terminal
eval "$format" # format according to command stored in the $format variable above

#------------------ 02 ------------------#

eval "$format"
echo "Today is `date`." # interpolate date command into string
echo "You are in $(pwd) and your host is `hostname`." # interpolate commands pwd and hostname into string

#------------------ 03 ------------------#

eval "$format"
echo "There are ${#} parameters that include: ${@}." # interpolate number of args and args into string
echo "The first is ${ONE}, the second is ${TWO}, the third is ${THREE}." # interpolate the first three arguments into string

#------------------ 04 ------------------#

eval "$format"
read -p  "Please enter the street that you grew up on: " # prompt user for input
STREET=$REPLY # store input to variable
read -p "Please enter the town that you grew up in: "
TOWN=$REPLY
echo "     The street I grew up on was ${STREET} and the town was ${TOWN}."

#------------------ 05 ------------------#

eval "$format"
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

#------------------ 06 ------------------#

eval "$format"
for animal in "moose" "cow" "goose" "sow"; do # print args array in string
	echo "I have a ${animal}."
done

#------------------ 07 ------------------#

[ -d ~/Development/non-exist ] && # check for the existence of directory
	echo 'Present: directory "non-exist"' ||
	echo 'Absent: direrctory "non-exist"'
ls /non-exist > /dev/null 2>&1 # redirect all output to nowhere
eval "$format"

#------------------ 08 ------------------#

ls /non-exist > /dev/null ||
	echo 'Error: this is an explicit error message for the above error' >&2 # redirect custom error message to $STDERR
eval "$format"

#------------------ 09 ------------------#

echo 'Is the "weather" script here?'
test -f ~/Development/public-bin/02-weather.sh && echo 'Yep' || echo 'Nope'
eval "$format"

which ifconfig > /dev/null # redirect output to nowhere
if [ "$?" != "0" ]; then # check exit code of previous command
	# message user if command failed
	echo 'SyncAll error: "ifconfig" is not installed' >&2
	echo 'Ubuntu and Mint: run "sudo apt-get install net-tools"' >&2
	exit 1 # cut after printing error
else
	echo 'Congrats! you have "ifconfig"' # or congratulate user for having net tools
fi

#------------------ 10 ------------------#

echo $'\n'$"place a blank line above this text" #places blank line above output
eval "$format"

#------------------ 11 ------------------#

cat << _eof_ # create a block of formatted text

CHOOSE -- the Greatest Cereal of All Time (this is a test).
	1) Grape Nuts
	2) Crispix
	3) Raisin Bran
	4) Life
	5) Golden Grahams
	6) Lucky Charms
_eof_

read -n 1 -s choice;
	case $choice in
		1) sleep 1 && echo $'\n'$"A solid start to the day." && echo " ";; # grape nuts
		2) sleep 1 && echo $'\n'$"The greatest." && echo " ";; # crispix
		3) sleep 1 && echo $'\n'$"Beware to many water-soluable fibers." && echo " ";; # raisin bran
		4) sleep 1 && echo $'\n'$"Not overdoing it. Smart." && echo " ";; # life
		5) sleep 1 && echo $'\n'$"The greatest plus sugar." && echo " ";; # golden grahams
		6) sleep 1 && echo $'\n'$"Bacchanalia!" && echo " ";; # lucky charms
		*) sleep 1 && echo $'\n'$"Invalid input." && echo " ";;
	esac

eval "$format"

exit 0

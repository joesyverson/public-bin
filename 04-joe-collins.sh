#!/bin/bash -x

# scripts for Joe Collins Youtube tutorial

format='echo "Exit code: $?" && echo " "' # store this command to be called later like a function

cat << _EOF_ # create a block of formatted text

This is a test.
	I want to see formatted text in the terminal.
	Could come in handy one day.
	This is a poem <3

_EOF_

# break a single line into two using back slash
echo 'hello' \
	&& echo 'world' > /dev/null # redirect second line to nowhere so it is not logged to terminal
eval "$format" # format according to command stored in the $format variable above

[ -d ~/Development/non-exist ] && # check for the existence of directory
	echo 'Present: directory "non-exist"' ||
	echo 'Absent: direrctory "non-exist"'
ls /non-exist > /dev/null 2>&1 # redirect all output to nowhere
eval "$format" 

ls /non-exist > /dev/null ||
	echo 'Error: this is an explicit error message for the above error' >&2 # redirect custom error message to $STDERR
eval "$format"

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
eval "$format"

exit 0

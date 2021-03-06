#!/bin/bash

# my first script
	# for syntax study
# this is gonna be a very long script
# call with
	# ./01-hello-bash.sh <foo> <bar> <baz>
	# or
	# bash 01-hello-bash.sh <foo> <bar> <baz>

#################### CHECK ERRORS ####################

if [[ $# != 3 ]]; then # test for number of arguments
	echo " "
	echo "!error!"
	echo " "
	echo "wrong number of arguments. call with three arguments:"
	echo "     ./${0}  <foo> <bar> <baz>"
	echo " "
	exit 1
fi

#################### FUNCTIONS AND VARIABLES ####################

[ ! -f /tmp/01-hello-bash.log ] && touch /tmp/01-hello-bash.log && echo " " > /tmp/01-hello-bash.sh ||
	echo " " > /tmp/01-hello-bash.log # make a file in temporary directory or wipe file if it already exists
log_file="/tmp/01-hello-bash.log" # set variable for log file

counter=0 # set global variable counter

function format() { # format terminal output
	log_file="/tmp/01-hello-bash.log" # reset variable for function scope
	echo " " | tee -a ${log_file} # output to terminal and send the output to log file
	let counter=$((counter+1)) # increment global counter variable
	echo "--------------- ${counter} ---------------" | tee -a ${log_file}
	echo " " | tee -a ${log_file}
	echo ${1} | head -n 1 | tee -a ${log_file} # print first line of echoed argument
	return ${counter}
}

function print_args() { # function for printing arguments along with the corresponding index from the args array
	i=1 # create counter variable
	echo "args are: "
	for arg in $@; do # do the following for all arguments
	        echo "     (${i}) ${arg}"
	        i=$((i + 1)) # increment counter
	done
}

#################### COMMANDS ####################

echo " " | tee -a ${log_file}
echo "*************** ${0} ***************" | tee -a ${log_file} # interpolate filename into string

echo "save" | format "hello world" # pipe command into function to preserve return statement in $PIPESTATUS
counter=${PIPESTATUS[1]} # reset counter to the return value of format

echo "save" | format ${HOME}
counter=${PIPESTATUS[1]}

root=`ls /`
echo "save" | format "this is root: `echo ${root}`"
counter=${PIPESTATUS[1]}

# echo "save" | format "ls /home/joes/there-is-no-such-file" || echo "!error!"
# counter=${PIPESTATUS[1]}

echo "save" | format "`(ls /home/joes/there-is-no-such-file 2>> /dev/null || echo "!error!")`"
counter=${PIPESTATUS[1]}

args=`print_args ${1} ${2} ${3}`
echo "save" | format "${args[@]}"
counter=${PIPESTATUS[1]}

echo " " | tee -a ${log_file}

exit 0

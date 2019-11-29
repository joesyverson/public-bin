#!/bin/bash

# my first script
	# for syntax study
# this is gonna be a very long script
# call with
	# ./01-hello-bash.sh <foo> <bar> <baz>
	# or
	# bash 01-hello-bash.sh <foo> <bar> <baz>

#################### BEGIN SCRIPT ####################

echo " "
echo "*************** ${0} ***************"

counter=0

# touch 01-out.txt
# file=01-out.txt

if [[ $# != 3 ]]; then
	echo " "
	echo "!error!"
	echo " "
	echo "wrong number of arguments. call with three arguments:"
	echo "     ./${0}  <foo> <bar> <baz>"
	echo " "
	exit
fi

#################### FUNCTIONS ####################

function format() {
	# file=01-out.txt
	echo " " # >> ${file}
	let counter=$((counter+1))
	echo "--------------- ${counter} ---------------"
	echo " "
	echo ${1} | head -n 1 # >> ${file}
	return ${counter}
}

function print_args() {
	i=1
	echo "args are: " 
	for arg in $@; do
	        echo "     (${i}) ${arg}"
	        i=$((i + 1))
	done
}

#################### COMMANDS ####################

echo "save" | format "hello world"
counter=${PIPESTATUS[1]}

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

echo " "

exit

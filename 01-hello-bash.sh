#!/bin/bash

# my first script
	# for syntax study

# this is gonna be a very long script

# call with
	# ./01.sh <foo> <bar> <baz>
	# or
	# bash 01-hello-bash.sh <foo> <bar> <baz>

# touch 01-out.txt
# file=01-out.txt

echo " " # >> ${file}
echo "hello world" # >> ${file}
echo " " # >> ${file}

echo " " # >> ${file}
echo ${HOME} # >> ${file}
echo " " # >> ${file}

root=`ls /`
echo " " # >> ${file}
echo "this is root: `echo ${root}`" # >> ${file}
echo " " # >> ${file}

echo " " # >> ${file}
(echo "`ls /home/joes/there-is-no-such-file`" || echo "--!error!--") # >> ${file}
echo " " # >> ${file}

echo " " # >> ${file}
(ls /home/joes/there-is-no-such-file || echo "--!error!--") # >> ${file}
echo " " # >> ${file}

echo " " # >> ${file}
function print_args() {
        if [[ $# = 3 ]]; then
                i=1
                echo "args: " # >> ${file}
                for arg in $@; do
                        echo "     arg ${i}: ${arg}" # >> ${file}
                        i=$((i + 1))
                done
        else
                echo "--!error!-- wrong number of arguments. call with" # >> ${file}
                echo "     ./home/joes/bin/${0}  <foo> <bar> <baz>" # >> ${file}
        fi
}
print_args ${1} ${2} ${3}
echo " " # >> ${file}

#!/bin/bash

while getopts :a:b:c: opts; do
    case $opts in
        a) first=$OPTARG;;
        b) sec=$OPTARG;;
        c) third=$OPTARG;;
    esac
done

echo "opts: $first $sec $third"
exit 0

echo '   no commands to test'
exit 1

#!/bin/bash

function _line_match_exact_replace () {

    _MATCH=$1
    _REPLACE=$2
    _FILE=$3

    sed -i "s/$_MATCH/$_REPLACE/" $_FILE

}

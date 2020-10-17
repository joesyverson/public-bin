#!/bin/bash

function _line_match_remove () {

    _MATCH=$1
    _FILE=$2

    sed -i "/$_MATCH/d" $_FILE

}

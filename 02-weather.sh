#!/bin/bash

# script simplifies checking weather from the terminal
        # V 1 simply tells weather at current location

# alias as "weather" for ease of call
        # in ~/.bashrc or /etc/bash.bashrc write
                # alias weather="<path>/02-weather.sh"

# get curl if not installed
path="/usr/bin/"
vdpkg="${path}dpkg"
vsudo="${path}sudo"
vaptget="${path}sudo"
vinstall="${path}install"
$vdpkg -s curl || $vsudo $vaptget -y $vinstall curl

# return error if user passes arguments
if [[ $# != 0 ]]; then
	vecho="${path}echo"
        $vecho "--!error!--"
        $vecho "V 1 of this program does not take arguments"
        $vecho "call without arguments or wait for V 2 dammit"
else
        # get weather using curl
	vcurl="${path}curl"
        $vcurl wttr.in
fi

exit
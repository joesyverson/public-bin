#!/bin/bash

################# functions #################

hlp() {
	echo $'\n...pass -b on call to install basic CLI packages...'
	echo $'\n...pass -d on call to install GUI packages...\n'
}

getit() {
	echo $'\n...updating software from repositories...\n'
	sudo apt-get update
	sleep 1

	if [ $1 == 'basic' ]; then
		echo $'\n...getting basic CLI packages...'
<<<<<<< HEAD
        packages=$(cat ./public-bin/conf/pkglist.conf)
=======
        packages=$(cat ./conf/pkglist.conf)
>>>>>>> b909197... Add upconf and configure
#		declare -a packages=( "tree" "locate" "alpine" "cmus" "htop" "mc" "tmux" "dictd" "curl" "wget" "net-tools" "xclip" "w3m" "vim" "bc" "weather" "ffmpeg" "nmap" )
	else
		echo $'\n...getting basic GUI packages...'
		# gimp inkscape
		declare -a packages=( "firefox" "gpick" "transmission" "redshift-gtk" "vlc" "gthumb" )
	fi

	for package in ${packages[@]}; do
        	echo -e $"\n...getting ${package}...\n"
        	sleep 1
        	dpkg -s $package || sudo apt-get install -yyq $package
   	done

	sleep 1
	
	echo $"\n...removing unnecessary dependencies..."
	sudo apt-get autoremove
	# sudo apt-get autoeclean

	sleep 1
}


################# script #################

if [ $# -eq 0 ]; then
	hlp
	exit 1
fi

while getopts :bdh opts; do
    case $opts in
        b) getit basic;;
	d) getit desktop;;
	h) hlp; exit 0;;
    esac
done

sleep 1

echo $'\n...done!\n'

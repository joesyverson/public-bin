#!/bin/bash

# adapt phases 1-3 to modify new user

cat <<_EOF_

   =====================
   = J0ES SETUP SCRIPT =
   = ----------------- =
   =   Version Ubuntu  =
   =====================

_EOF_

################### FUNCTIONS ###################

help() {
cat <<_EOF_

   =====================
   = J0ES SETUP SCRIPT =
   = ----------------- =
   =   Version Ubuntu  =
   =====================

   Declare a username before running with the variable $remoter:

      remoter=<username>

   For special packages, pass the following arguments in any order:

      desktop
      devops
      data
      server

_EOF_
}

desktop() {
    echo "...getting GUI packages..."
    
    declare -a ${desktop_packages[@]}=( "firefox" "subl" "gimp" "inskape" "gpick" "transmission" "redshift-gtk" "vlc" )
    
    for package in $desktop_packages; do
        dpkg -s $package || sudo apt-get install -yyq $package
    done
    
    sleep 1
}

devops() {
    echo "...getting devops packages..."
    
    # jenkins, terraform, kubernetes, elk

    declare -a ${devops_packages[@]}=( "ansible" "git" )
    for package in $devops_packages; do
        dpkg -s $package || sudo apt-get install -yyq $package
    done

    getdocker

    sleep 1
}

data() {
    # SQLite
    # J? R?
}

server() {
    # NginX PostgreSQL
}

getdocker() {
    echo $'...getting Docker...\n'
    sleep 1


    echo $'...making sure Docker is not installed...\n'
    sleep 1
    sudo apt-get remove -yyq docker docker-engine docker.io containerd runc

    echo $'...getting dependencies...\n'
    sleep 1
    sudo apt-get install -yyq apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    
    echo $'...authenticating...\n'
    sleep 1
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    # note warning: Warning: apt-key output should not be parsed (stdout is not a terminal)
    fingerprint=$(sudo apt-key fingerprint 0EBFCD88 | sed -n 5p)
    if [ $fingerprint != '9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88']; then
        echo '...bad fingerprint! Unsafe to install...'
        exit 1
    fi

    echo $'...getting Docker...\n'
    sleep 1
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install -yyq docker-ce docker-ce-cli containerd.io

    echo $'...got docker!\n'
    sleep 1
}

################### PHASE ZERO ###################

echo $'   Phase Zero: set user...*'
echo $'\n...setting user and permissions...'
sleep 1

sudo adduser --disabled-password --gecos "" $remoter
# give new user no password pivileges
sudo usermod -aG sudo $remoter # this makes sudoer but does not set password, without which it is impossible to do super
# echo "$password" "$password" | sudo passwd $remoter

sudo mkdir -p /home/$remoter/.ssh
sudo cp .ssh/authorized_keys /home/$remoter/.ssh/
sudo chown -R $remoter:$remoter /home/$remoter/.ssh
sudo chmod 700 /home/$remoter/.ssh
sudo chmod 600 /home/$remoter/.ssh/authorized_keys

# ECHO COMMANDS NOT WORKING IN CONDITIONAL BELOW
sudo grep AllowUsers /etc/ssh/sshd_config > /dev/null
if [ $? = '1' ]; then
    sudo sed "/AllowUsers/c\AllowUsers $remoter/g" /etc/ssh/sshd_config
    sudo echo "DenyUsers ubuntu" >> /etc/ssh/sshd_config
else
    sudo echo "AllowUsers $remoter" >> /etc/ssh/sshd_config
    sudo echo "DenyUsers ubuntu" >> /etc/ssh/sshd_config
fi

sudo systemctl restart sshd

################### PHASE ONE ###################

echo $'   Phase One: set prompts...*'
echo $'\n...setting prompts for current user...'

grep -n PS1 ~/.bashrc | cut -d ":" -f1 | while IFS= read -r line_number ; do
	sed -i "${line_number}s~.*~PS1='\\\[\\\033[1;36m\\\]$ >\\\[\\\033[00m\\\] '~" .bashrc;
done
sleep 1

echo $'\n...setting prompts for ROOT...'
sudo grep -n PS1 /root/.bashrc | cut -d ":" -f1 | while IFS= read -r line_number ; do
	sudo sed -i "${line_number}s~.*~PS1='\\\[\\\033[1;36m\\\]# >\\\[\\\033[00m\\\] '~" /root/.bashrc;
done
sleep 1

################### PHASE TWO ###################

echo $'\n   Phase Two: get software...*'
sleep 1

echo $'\n...updating software from repositories...'
sudo apt-get update
sleep 1

declare -a packages=( "tree" "locate" "vim" "alpine" "cmus" "htop" "mc" "tmux" "dictd" "curl" "wget" "net-tools" "xclip" "w3m" "vim")

echo $'\n...getting CLI packages...'
sleep 1

for package in ${packages[@]}; do
	echo -e $"\n...getting ${package}...\n"
	sleep 1
	dpkg -s $package || sudo apt-get install $package
done
sleep 1

for arg in $@; do
    if [ $arg = 'help']; then
        help
    fi

    if [ $arg = 'desktop' ]; then
        desktop
    fi

    if [ $arg = 'desktop' ]; then
        devops
    fi
done

echo "...removing unnecessary dependencies..."
sudo apt-get autoremove
# sudo apt-get autoclean

################### PHASE THREE ###################

echo $'\n   Phase Three: set aliases...'
sleep 1

echo $'\n...setting aliases for current user...'
cat << _EOF_ >> ~/.bashrc

# my aliases -- joes
alias copy='xclip -sel clip'

_EOF_
sleep 1

echo $'\n...setting aliases for ROOT...'
sudo cat << _EOF_ >> /root/.bashrc

# my aliases -- joes
alias copy='xclip -sel clip'

_EOF_
# sleep 1

echo $'\n...all done! Run\n   source ~/.bashrc\n'
exit

#!/bin/bash

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
#!/bin/bash

set -euo pipefail

USERNAME=$1

if [ -z $USERNAME ]; then
  echo "Must enter an argument with username"
  exit 1
fi

sudo apt-get update

# Add the following packages
sudo apt-get install tmux
sudo apt-get install xclip
sudo apt-get install git
sudo apt-get install vim
sudo apt-get install dpkg
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Assuming I'm still using openvpn as my local vpn
sudo apt-get install openvpn
mkdir $HOME/.openvpn
chown $1:$1 $HOME/.openvpn
chmod 760 $HOME/.openvpn

# Create any necessary directories
mkdir $HOME/Apps
mkdir $HOME/Projects

# Turn on necessary services
sudo ufw enable # turn on firewall

# The things I do for VSCode...
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code

# modify .bashrc file
echo "export HISTFILE=/dev/null" >> $HOME/.bashrc
echo "export HISTSIZE=\"\"" >> $HOME/.bashrc
echo "export EDITOR=vim" >> $HOME/.bashrc
echo "umask 027" >> $HOME/.bashrc # all files created give no access to other

# modify all aliases on .bashrc
echo "alias gpoh=\"git push origin HEAD\"" >> $HOME/.bashrc

source $HOME/.bashrc

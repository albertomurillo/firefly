#!/bin/bash

which git > /dev/null
if [[ $? != 0 ]]; then
    echo "Installing git"
    sudo apt install git -y
fi

if [[ ! -d ~/github ]]; then
    echo "Creating $HOME/github"
    mkdir ~/github
fi

if [[ ! -d ~/github/firefly ]]; then
    echo "Cloning firefly repo"
    git clone https://github.com/albertomurillo/firefly ~/github/firefly
fi

which ansible > /dev/null
if [[ $? != 0 ]]; then
    echo "Installing ansible"
    sudo apt install ansible -t
fi

cd ~/github/firefly
sudo ansible-galaxy install -r requirements.yml
ansible-playbook main.yml

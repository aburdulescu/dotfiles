#!/bin/bash

if [[ ! -z $(lsb_release -a | grep -i "manjaro") ]]
then
    PACKMNGR=pacman
    PACKMNGR_OPTS=-Sy
else if [[ ! -z $(lsb_release -a | grep -i "debian") ]]
     then
         PACKMNGR=apt-get
         PACKMNGR_OPTS=-y install
     else
         echo "Unknown distro"
         exit 1
     fi
fi

PACKAGES="git emacs tmux mc"

for p in $PACKAGES
do
    $PACKMNGR $PACKMNGR_OPTS $p
done

# dotfiles
# mkdir -p ~/projects
# cd ~/projects

# git clone https://gitlab.com/aburdulescu/dotfiles.git

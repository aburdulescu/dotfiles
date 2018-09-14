#!/bin/bash

install_packages()
{
    PACKAGES="git \
              emacs \
              build-essential \
              tmux \
              cmake"

    sudo apt-get update
    sudo apt-get install $PACKAGES
}

main()
{
    install_packages
}


set -e # stop on error
set -x # print what's executed
main

#!/bin/bash

cleanup()
{
}

install_packages()
{
    PACKAGES="git \
              emacs \
              build-essential \
              tmux \
              cmake \
              stow"

    sudo apt-get update
    sudo apt-get install $PACKAGES
}

install_dotfiles()
{
    stow tmux
    [[ "$SHELL" == "/usr/bin/zsh" ]] && stow zsh || [[ "$SHELL" == "/bin/bash" ]] && stow bash
    stow emacs
}

main()
{
    install_packages
    install_dotfiles
}


set -e # stop on error
set -x # print what's executed
main

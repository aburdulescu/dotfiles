#!/bin/bash

cleanup()
{
    rm -rf ~/.emacs.d \
       ~/.bash_aliases \
       ~/.zsh_aliases \
       ~/.tmux.conf
}

install_packages()
{
    sudo apt-get update
    sudo apt-get install -y git \
         emacs \
         build-essential \
         tmux \
         cmake \
         stow
}

install_dotfiles()
{
    stow tmux
    [[ "$SHELL" == "/usr/bin/zsh" ]] && stow zsh && echo ". ~/.zsh_aliases" >> ~/.zshrc
    [[ "$SHELL" == "/bin/bash" ]] && stow bash
    stow emacs
}

main()
{
    install_packages
    cleanup
    install_dotfiles
}


set -e # stop on error
set -x # print what's executed
main

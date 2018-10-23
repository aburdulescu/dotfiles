#!/bin/bash

cleanup()
{
    rm -rf ~/.emacs.d \
       ~/.bash_aliases \
       ~/.zsh_aliases \
       ~/.tmux.conf \
       ~/.gitconfig
}

install_packages()
{
    sudo apt update
    sudo apt install -y \
         build-essential \
         tmux \
         cmake \
         zsh \
         python3 \
         python3-pip \
         python3-venv \
         stow \
         vim \
         gnome-terminal \
         chromium \
         curl \
         gdb \
         net-tools
}

install_sudo()
{
    apt update && apt install sudo
    adduser aburdulescu sudo
}

install_ui()
{
    sudo apt update
    sudo apt install -y xorg i3 lightdm
    sudo dpkg-reconfigure lightdm
}

prepare_for_vboxguestadditions()
{
    sudo apt update
    sudo apt install -y module-assistant
    sudo m-a prepare
}

install_emacs()
{
    sudo apt build-dep -y emacs25
    echo "Download emacs source from a mirror and install it!!"
}

install_ohmyzsh()
{
    sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_dotfiles()
{
    stow tmux
    [[ "$SHELL" == "/usr/bin/zsh" ]] && stow zsh && echo ". ~/.zsh_aliases" >> ~/.zshrc
    [[ "$SHELL" == "/bin/bash" ]] && stow bash
    stow emacs
    stow git
}

main()
{
    set -e # stop on error
    set -x # print what's executed

#    install_sudo
    install_packages
#    install_ui
#    install_emacs
#    install_ohmyzsh

#    prepare_for_vboxguestadditions

    [[ "$1" == "-f" ]] && cleanup

    install_dotfiles
}

main $@

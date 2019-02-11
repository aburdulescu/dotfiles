#!/bin/bash

install_misc()
{
    sudo apt update
    sudo apt install -y \
        stow \
        vim \
        gnome-terminal \
        chromium \
        curl \
        net-tools
}

install_python()
{
    sudo apt update
    sudo apt install -y \
        python3 \
        python3-pip \
        python3-venv
}

install_ctools()
{
    sudo apt update
    sudo apt install -y \
        build-essential \
        gdb \
        cmake
}

install_sudo()
{
    apt update && apt install sudo
    adduser aburdulescu sudo
    echo "Reboot needed!"
}

install_ui()
{
    sudo apt update && sudo apt install -y xorg i3 lightdm
    sudo dpkg-reconfigure lightdm
    echo "Reboot needed!"
}

install_vboxguestadditions()
{
    sudo apt update && sudo apt install -y module-assistant
    sudo m-a prepare -y
    echo "Reboot needed!"
}

install_tmux()
{
    sudo apt update && sudo apt install -y tmux
    rm -f ~/.tmux.conf
    stow tmux
}

install_git()
{
    sudo apt update && sudo apt install -y git
    rm -f ~/.gitconfig
    stow git
}

install_emacs()
{
    sudo apt update && sudo apt install -y emacs25
    rm -rf ~/.emacs.d
    stow emacs
}

install_ohmyzsh()
{
    sudo apt update && sudo apt install -y zsh
    rm -f ~/.zsh_aliases
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    stow zsh && echo ". ~/.zsh_aliases" >> ~/.zshrc
    echo "Reboot needed!"
}

install_go()
{
    sudo apt update && sudo apt install -y golang

    echo "export GOPATH=$HOME/go" >> ~/.zshrc
    echo "export PATH=$PATH:$GOPATH/bin" >> ~/.zshrc

    mkdir -p ~/go/bin ~/go/src
}

usage()
{
    echo "Usage: $0 OPTIONS"
    echo "OPTIONS:"
    echo -e "\th - print this message"
    echo -e "\ta - C tools(gcc, make, gdb etc.)"
    echo -e "\tb - Emacs"
    echo -e "\tc - Go"
    echo -e "\td - Git"
    echo -e "\te - Miscellaneous"
    echo -e "\tf - Oh-my-zsh"
    echo -e "\tg - Python"
    echo -e "\th - Sudo"
    echo -e "\tj - Tmux"
    echo -e "\tk - UI"
    echo -e "\tl - VBoxGuestAdditions"
}

main()
{
    set -e # stop on error

    if [[ $1 == ""  ]]
    then
        usage
        exit 1
    fi

    while getopts 'abcdefgijklh' c
    do
        case $c in
            a) INSTALL_CTOOLS=1 ;;
            b) INSTALL_EMACS=1 ;;
            c) INSTALL_GO=1 ;;
            d) INSTALL_GIT=1 ;;
            e) INSTALL_MISC=1 ;;
            f) INSTALL_OHMYZSH=1 ;;
            g) INSTALL_PYTHON=1 ;;
            i) INSTALL_SUDO=1 ;;
            j) INSTALL_TMUX=1 ;;
            k) INSTALL_UI=1 ;;
            l) INSTALL_VBOXGADD=1 ;;
            h|*) usage ;;
        esac
    done

    if [[ $INSTALL_CTOOLS == 1 ]]
    then
        install_ctools
    fi
    if [[ $INSTALL_EMACS == 1 ]]
    then
        install_emacs
    fi
    if [[ $INSTALL_GO == 1 ]]
    then
        install_go
    fi
    if [[ $INSTALL_GIT == 1 ]]
    then
        install_git
    fi
    if [[ $INSTALL_MISC == 1 ]]
    then
        install_misc
    fi
    if [[ $INSTALL_OHMYZSH == 1 ]]
    then
        install_ohmyzsh
    fi
    if [[ $INSTALL_PYTHON == 1 ]]
    then
        install_python
    fi
    if [[ $INSTALL_SUDO == 1 ]]
    then
        install_sudo
    fi
    if [[ $INSTALL_TMUX == 1 ]]
    then
        install_tmux
    fi
    if [[ $INSTALL_UI == 1 ]]
    then
        install_ui
    fi
    if [[ $INSTALL_VBOXGADD == 1 ]]
    then
        install_vboxguestadditions
    fi
}

main $@

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
         xorg \
         i3 \
         lightdm \
         module-assistant \
         build-essential \
         tmux \
         cmake \
         zsh \
         python3 \
         python3-pip \
         python3-venv \
         stow
    sudo apt build-dep emacs     
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

    install_packages
    [[ "$1" == "-f" ]] && cleanup
    install_dotfiles

    set +e # stop on error
    set +x # print what's executed

    echo -e "Now you have to:\n"
    echo -e "\tInstall oh-my-zsh:"
    echo 'sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'

    echo -e "\n\tInstall emacs:"
    echo "Download emacs source from ftp and install it!!"
}

main $@

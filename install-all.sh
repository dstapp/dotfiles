#!/usr/bin/env zsh

set -e

DIR=${0:a:h}

git submodule init
git submodule update

#$DIR/powerline-fonts/install.sh

stow vim
stow zsh
stow shell-theme
stow tmux
stow git

#cd ~/.vim/bundle/command-t && rake make

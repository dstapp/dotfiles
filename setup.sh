#!/usr/bin/env zsh

set -e

DIR=${0:a:h}

git submodule init
git submodule update

$DIR/powerline-fonts/install.sh

ln -sf $DIR/.config           $HOME/.config
ln -sf $DIR/.vim              $HOME/.vim
ln -sf $DIR/.vimrc            $HOME/.vimrc
ln -sf $DIR/.zsh              $HOME/.zsh
ln -sf $DIR/.zshrc            $HOME/.zshrc
ln -sf $DIR/tmux/.tmux.conf   $HOME/.tmux.conf
ln -sf $DIR/.tmux.conf.local  $HOME/.tmux.conf.local
ln -sf $DIR/.gitconfig        $HOME/.gitconfig

#cd ~/.vim/bundle/command-t && rake make

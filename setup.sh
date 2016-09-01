#!/usr/bin/env zsh

DIR=${0:a:h}

git submodule init
git submodule update

ln -sf $DIR/.config           $HOME/.config
ln -sf $DIR/.vim              $HOME/.vim
ln -sf $DIR/.vimrc            $HOME/.vimrc
ln -sf $DIR/.vimrc_background $HOME/.vimrc_background
ln -sf $DIR/.zsh              $HOME/.zsh
ln -sf $DIR/.zshrc            $HOME/.zshrc

mkdir $HOME/.vimbackup

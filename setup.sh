#!/usr/bin/env zsh

DIR=${0:a:h}

git submodule init
git submodule update

$DIR/powerline-fonts/install.sh

ln -sf $DIR/.config           $HOME/.config
ln -sf $DIR/.vim              $HOME/.vim
ln -sf $DIR/.vimrc            $HOME/.vimrc
ln -sf $DIR/.vimrc_background $HOME/.vimrc_background
ln -sf $DIR/.zsh              $HOME/.zsh
ln -sf $DIR/.zshrc            $HOME/.zshrc
ln -sf $DIR/tmux/.tmux.conf   $HOME/.tmux.conf
ln -sf $DIR/.tmux.conf.local  $HOME/.tmux.conf.local
ln -sf $DIR/.khdrc            $HOME/.khdrc
ln -sf $DIR/.kwm              $HOME/.kwm

[ -d $HOME/.vimbackup ] || mkdir $HOME/.vimbackup

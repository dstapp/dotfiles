#!/usr/bin/env zsh

set -e

git submodule init
git submodule update

stow vim
stow zsh
stow git

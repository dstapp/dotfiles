dotfiles
========

Collection of various config files for macOS (tested 10.10 - 10.12). For easier management, you should have GNU Stow installed.

# Installation

```
cd ~/
git clone --recursive https://github.com/dprandzioch/dotfiles.git
cd dotfiles/
stow zsh
stow vim
stow whateverYouWant
```

# vim
I use vim-plug for managing plugins, so make sure to install it first: https://github.com/junegunn/vim-plug

# tmux
I use tpm for managing plugins, make sure to install it first: https://github.com/tmux-plugins/tpm

# Remark vim/vimproc
run "make" inside the plugin folder

# tern
If you use Pathogen or something similar, you can clone this repository to your ~/.vim/bundle (or equivalent) directory. Make sure you have node.js and npm installed (Tern is a JavaScript program), and install the tern server by running npm install in the bundle/tern_for_vim directory.

# ricing
If you're curious, on CLI I use powerline-patched Consolas: https://github.com/Znuff/consolas-powerline
and Rubik as a UI system font: https://fonts.google.com/specimen/Rubik
alogside nord theme wherever possible: https://www.nordtheme.com/

On KDE, I use a mix of Ark Dark and Nordic themes.

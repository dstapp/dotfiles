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

# Remark vim/vimproc
run "make" inside the plugin folder

# tern
If you use Pathogen or something similar, you can clone this repository to your ~/.vim/bundle (or equivalent) directory. Make sure you have node.js and npm installed (Tern is a JavaScript program), and install the tern server by running npm install in the bundle/tern_for_vim directory.

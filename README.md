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

# Brewfile

My Brewfile contains all applications I need. macOS can be provisioned using this
file but homebrew is required.

## Install Homebrew

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

## Install homebrew-bundle

`brew tap Homebrew/bundle`

## Install apps

```
cd ~/dotfiles/_osx/home/
brew bundle
```

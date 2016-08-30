dotfiles
========

Collection of various config files for macOS (tested 10.10 - 10.12)

# Installation

```
cd ~/
git init
git remote add origin https://github.com/dprandzioch/dotfiles.git
git branch --set-upstream-to=origin/master
git pull
```

# VIM

VIM uses various submodules, so you have to initialize them after checkout:

```
cd ~/
git submodule init
git submodule update
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
cd ~/
brew bundle
```

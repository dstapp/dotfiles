dotfiles
========

Collection of various config files for macOS (tested 10.10 - 10.12)

# Installation

```
cd ~/
git clone https://github.com/dprandzioch/dotfiles.git
cd dotfiles/
./setup.sh
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
cd ~/dotfiles
brew bundle
```

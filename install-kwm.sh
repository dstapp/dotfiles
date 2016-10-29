#!/bin/bash

brew install koekeishiya/kwm/kwm
brew install koekeishiya/khd/khd
brew services start koekeishiya/khd/khd
brew services start koekeishiya/kwm/kwm

brew cask install ubersicht
git clone https://github.com/herrbischoff/nerdbar.widget $HOME/Library/Application\ Support/Übersicht/widgets/nerdbar.widget
wget http://web.archive.org/web/20140125080215/http://osaka.is.land.to/files/Osaka.zip
unzip Osaka.zip
open Osaka.ttc
rm Osaka.zip

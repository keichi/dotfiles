#!/bin/sh
brew update
brew upgrade
brew cask upgrade
brew cleanup
brew cask cleanup
tldr -u
vim -c PlugUpdate

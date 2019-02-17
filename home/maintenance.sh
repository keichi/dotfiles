#!/bin/sh
brew update
brew upgrade
brew cask upgrade
brew cleanup
tldr -u
vim -c PlugUpdate -c qa

#!/bin/sh
brew update
brew upgrade
brew cleanup
tldr -u
vim -c PlugUpdate -c qa

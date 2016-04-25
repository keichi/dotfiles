#!/bin/bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install rcmdnk/file/brew-file
brew file install

# Install oh-my-fish
curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish


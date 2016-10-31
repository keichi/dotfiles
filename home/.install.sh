#!/bin/bash

# Install homeshick
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
homeshick clone git://github.com/keichi/dotfiles.git

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install rcmdnk/file/brew-file
brew file install

# Install oh-my-fish and plugins
curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish
omf install

# Install powerline
pip install powerline-status

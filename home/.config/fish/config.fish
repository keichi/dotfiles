# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins brew node rbenv bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

set -x PATH $HOME/Library/Haskell/bin $PATH
set -x PATH /usr/texbin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH /usr/local/gcc-arm/bin $PATH

set -x EDITOR vim

set -x LC_ALL ja_JP.UTF-8

# Python
set -x PYTHONPATH /usr/local/lib/python2.7/site-packages/ $PYTHONPATH

# Go
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

function fish_prompt
    ~/powerline-shell.py $status --shell bare ^/dev/null
end

set fish_greeting


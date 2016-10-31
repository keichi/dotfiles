# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/keichi/.local/share/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set -x PATH /usr/local/texlive/2016/bin/x86_64-darwin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH /usr/local/gcc-arm/bin $PATH
set -x PATH $HOME/.local/bin $PATH
set -x PATH /usr/local/share/git-core/contrib/diff-highlight $PATH

set -x EDITOR vim

set -x LC_ALL ja_JP.UTF-8

# Python
#
if test -s $HOME/.pythonz/etc/pythonz.fish
    source $HOME/.pythonz/etc/pythonz.fish
end

# Go
set -x GOPATH $HOME/go
set -x GOROOT /usr/local/opt/go/libexec
set -x PATH $GOPATH/bin $PATH

alias ghc="stack ghc"
alias ghci="stack ghci"
alias runghc="stack runghc"
alias runhaskell="stack runhaskell"

# Load homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.fish"


# Powerline
set fish_function_path $fish_function_path "/usr/local/lib/python2.7/site-packages/powerline/bindings/fish"
powerline-daemon -q
powerline-setup

set fish_greeting

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# OPAM configuration
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

eval (thefuck --alias | tr '\n' ';')

# Environment variables
#-------------------------------------------------------------------------------

export EDITOR=vim
export LC_ALL=ja_JP.UTF-8

# PATH
#-------------------------------------------------------------------------------

if [[ -d /usr/local/texlive/2016/bin/x86_64-darwin ]]; then
    export PATH=/usr/local/texlive/2016/bin/x86_64-darwin:$PATH
fi

if [[ -d $HOME/.local/bin ]]; then
    export PATH=$HOME/.local/bin:$PATH
fi

if [[ -d /usr/local/share/git-core/contrib/diff-highlight ]]; then
    export PATH=/usr/local/share/git-core/contrib/diff-highlight:$PATH
fi

# Programming languages
#-------------------------------------------------------------------------------

# Pythonz
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# Go
if [[ -d $HOME/go ]]; then
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$PATH
fi

# Haskell
alias ghc="stack ghc"
alias ghci="stack ghci"
alias runghc="stack runghc"
alias runhaskell="stack runhaskell"

# Tools
#-------------------------------------------------------------------------------

# Homebrew
alias brew="brew file brew"

# Homeshick
source $HOME/.homesick/repos/homeshick/homeshick.sh

# Powerline
source /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

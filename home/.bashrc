# Global definitions
#-------------------------------------------------------------------------------
if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
fi

# Programming languages
#-------------------------------------------------------------------------------

# direnv
eval "$(direnv hook bash)"

# Pythonz
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# Haskell
alias ghc="stack ghc"
alias ghci="stack ghci"
alias runghc="stack runghc"
alias runhaskell="stack runhaskell"
eval "$(stack --bash-completion-script stack)"

# Tools
#-------------------------------------------------------------------------------


# Homeshick
source $HOME/.homesick/repos/homeshick/homeshick.sh

# Powerline
source $HOME/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

# LaTeX Live
if [[ -d /usr/local/texlive/2016/bin/x86_64-darwin ]]; then
    PATH=/usr/local/texlive/2016/bin/x86_64-darwin:$PATH
fi

# git-diff-highlight
if [[ -d /usr/local/share/git-core/contrib/diff-highlight ]]; then
    PATH=/usr/local/share/git-core/contrib/diff-highlight:$PATH
fi

# colordiff
if [[ -x $(which colordiff) ]]; then
    alias diff='colordiff -u'
else
    alias diff='diff -u'
fi

# TAU
PATH=/home/keichi/Projects/tau-2.26/x86_64/bin:$PATH

# Environment Modules
[[ -f /usr/share/Modules/init/bash ]] && source /usr/share/Modules/init/bash

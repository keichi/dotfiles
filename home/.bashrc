# Global definitions
#-------------------------------------------------------------------------------
if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
fi

# Programming languages
#-------------------------------------------------------------------------------

# direnv
type direnv > /dev/null 2>&1 && eval "$(direnv hook bash)"

# Pythonz
[[ -s $HOME/.pythonz/etc/bashrc ]] && source "$HOME/.pythonz/etc/bashrc"

# Haskell
if type stack > /dev/null 2>&1; then
    alias ghc="stack ghc"
    alias ghci="stack ghci"
    alias runghc="stack runghc"
    alias runhaskell="stack runhaskell"
    eval "$(stack --bash-completion-script stack)"
fi

# Rust (Cargo)
[[ -d $HOME/.cargo/bin ]]; PATH=$PATH:$HOME/.cargo/bin

# Tools
#-------------------------------------------------------------------------------

# vim
if [[ "$(uname)" = 'Darwin' ]]; then
    alias vim="reattach-to-user-namespace vim"
fi

# Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# Powerline
if [[ "$(uname)" = 'Darwin' ]]; then
    source "/usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh"
elif [[ "$(uname)" = 'Linux' ]]; then
    source "/usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh"
fi

# LaTeX Live
if [[ -d /usr/local/texlive/2016/bin/x86_64-darwin ]]; then
    PATH=/usr/local/texlive/2016/bin/x86_64-darwin:$PATH
fi

# git-diff-highlight
if [[ -d /usr/local/share/git-core/contrib/diff-highlight ]]; then
    PATH=/usr/local/share/git-core/contrib/diff-highlight:$PATH
fi

# colordiff
if type colordiff > /dev/null 2>&1; then
    alias diff='colordiff -u'
else
    alias diff='diff -u'
fi

# Environment Modules
[[ -f /usr/share/Modules/init/bash ]] && source /usr/share/Modules/init/bash

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && source "/usr/local/etc/profile.d/autojump.sh"

# Colorful ls
if [[ "$(uname)" = 'Darwin' ]]; then
    export LSCOLORS=ExDxcxdxBxegedabagacad
    alias ls='ls -hG'
fi

# GPG Agent
eval $(gpg-agent --daemon --enable-ssh-support --use-standard-socket &> /dev/null)
GPG_TTY=$(tty)
export GPG_TTY
if [ -f "${HOME}/.gpg-agent-info" ]; then
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
fi

# Autocompletions
#-------------------------------------------------------------------------------
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/etc/bash_completion.d/git-completion.bash ] && . /usr/local/etc/bash_completion.d/git-completion.bash
[ -f /usr/local/etc/bash_completion.d/gibo-completion.bash ] && . /usr/local/etc/bash_completion.d/gibo-completion.bash
[ -f /usr/local/etc/bash_completion.d/brew ] && . /usr/local/etc/bash_completion.d/brew

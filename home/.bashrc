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

# Rust (Cargo)
[[ -d $HOME/.cargo/bin ]]; PATH=$PATH:$HOME/.cargo/bin

# Tools
#-------------------------------------------------------------------------------

# Use exa instead of ls if available
if type exa > /dev/null 2>&1; then
    alias ls='exa'
fi

# Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

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

# GPG Agent
gpgconf --launch gpg-agent
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"

# spack
export SPACK_ROOT=$HOME/.spack
[ -f $SPACK_ROOT/share/spack/setup-env.sh ] && source "$SPACK_ROOT/share/spack/setup-env.sh"

# Autocompletions
#-------------------------------------------------------------------------------
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/etc/bash_completion.d/git-completion.bash ] && . /usr/local/etc/bash_completion.d/git-completion.bash
[ -f /usr/local/etc/bash_completion.d/gibo-completion.bash ] && . /usr/local/etc/bash_completion.d/gibo-completion.bash
[ -f /usr/local/etc/bash_completion.d/brew ] && . /usr/local/etc/bash_completion.d/brew

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GOPATH=$HOME/go

export PATH="$HOME/.local/bin:$HOME/bin:$GOPATH/bin:$PATH"

export EDITOR=vim
export LESS='-R'
export PS1='[\u@\h \W]\$ '

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"

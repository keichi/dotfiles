# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

export GOPATH=$HOME/go

export PATH="$HOME/.local/bin:$HOME/bin:$GOPATH/bin:$PATH"

export EDITOR=vim
export LC_ALL=ja_JP.UTF-8
export LESS='-R'
export PS1='[\u@\h \W]\$ '

export PATH="$HOME/.cargo/bin:$PATH"

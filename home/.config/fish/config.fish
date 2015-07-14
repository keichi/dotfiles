# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Theme
Theme "robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
Plugin "brew"
Plugin "node"
Plugin "rbenv"
Plugin "bundler"

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

# CUDA
set -x PATH /Developer/NVIDIA/CUDA-7.0/bin $PATH
set -x DYLD_LIBRARY_PATH /Developer/NVIDIA/CUDA-7.0/lib $DYLD_LIBRARY_PATH


alias cp="rsync --archive --human-readable --progress --verbose --whole-file"

# ssh-agent
setenv SSH_ENV $HOME/.ssh/environment

function start_agent
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV
    . $SSH_ENV > /dev/null
    ssh-add
end

function test_identities
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else
        start_agent
    end
end

function fish_prompt
    ~/powerline-shell.py $status --shell bare ^/dev/null
end

set fish_greeting


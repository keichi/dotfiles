# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/keichi/.local/share/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set -x PATH /usr/local/texlive/2016/bin/x86_64-darwin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH /usr/local/gcc-arm/bin $PATH
set -x PATH $HOME/.local/bin $PATH

set -x EDITOR vim

set -x LC_ALL ja_JP.UTF-8

# Go
set -x GOPATH $HOME/go
set -x GOROOT /usr/local/opt/go/libexec
set -x PATH $GOPATH/bin $PATH

# CUDA
set -x PATH /Developer/NVIDIA/CUDA-7.0/bin $PATH
set -x DYLD_LIBRARY_PATH /Developer/NVIDIA/CUDA-7.0/lib $DYLD_LIBRARY_PATH

alias cp="rsync --archive --human-readable --progress --verbose --whole-file"
alias ghc="stack ghc"
alias ghci="stack ghci"
alias runghc="stack runghc"
alias runhaskell="stack runhaskell"

# Load homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.fish"

# Prevent "kqueue() FileSystemWatcher has reached the maximum nunmber of files
# to watch."
# c.f. https://github.com/aspnet/Home/issues/508
set -x MONO_MANAGED_WATCHER false

function fish_prompt
    ~/powerline-shell.py $status --shell bare ^/dev/null
end

set fish_greeting

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

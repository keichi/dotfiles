# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export CPATH="/opt/homebrew/include:$CPATH"
export LIBRARY_PATH="/opt/homebrew/lib:$LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/opt/homebrew/lib:$DYLD_LIBRARY_PATH"
export CMAKE_PREFIX_PATH="/opt/homebrew/share/cmake/Modules:$CMAKE_PREFIX_PATH"

# exa
if type exa > /dev/null 2>&1; then
    alias ls='exa'
fi

# homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# diff-highlight
if [[ -d $(brew --prefix git)/share/git-core/contrib/diff-highlight ]]; then
    export PATH=$(brew --prefix git)/share/git-core/contrib/diff-highlight:$PATH
fi

# go
export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# Zinit
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node
### End of Zinit's installer chunk

zinit light-mode for \
    zsh-users/zsh-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions

zinit snippet OMZP::autojump/autojump.plugin.zsh
zinit snippet OMZP::direnv/direnv.plugin.zsh
zinit snippet OMZP::gpg-agent/gpg-agent.plugin.zsh

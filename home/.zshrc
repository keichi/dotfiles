# locale
export LANG=ja_JP.UTF-8

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Terminal color
export TERM=xterm-256color

# Exa
if type exa > /dev/null 2>&1; then
    alias ls='exa'
fi

# Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# diff-highlight
if [[ -d $(brew --prefix git)/share/git-core/contrib/diff-highlight ]]; then
    export PATH=$(brew --prefix git)/share/git-core/contrib/diff-highlight:$PATH
fi

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# ~/.loca/bin
export PATH="$HOME/.local/bin:$PATH"

# nvim
alias vim='nvim'
alias vi='nvim'

# Zinit
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node
### End of Zinit's installer chunk

zinit light-mode for \
    zsh-users/zsh-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions

zinit snippet OMZP::autojump/autojump.plugin.zsh
zinit snippet OMZP::direnv/direnv.plugin.zsh
zinit snippet OMZP::gpg-agent/gpg-agent.plugin.zsh
zinit snippet OMZP::pyenv/pyenv.plugin.zsh

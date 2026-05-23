# locale
export LANG=ja_JP.UTF-8

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Terminal color
export TERM=xterm-256color

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

export EDITOR=nvim

# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light-mode for \
    zsh-users/zsh-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions

zinit snippet OMZP::autojump/autojump.plugin.zsh
zinit snippet OMZP::direnv/direnv.plugin.zsh
zinit snippet OMZP::gpg-agent/gpg-agent.plugin.zsh
zinit snippet OMZP::pyenv/pyenv.plugin.zsh

# dotfiles

## Installation

Install Xcode tools and agree to its license:
```
sudo xcode-select --install
sudo xcodebuild -license
```

Install homeshick and clone this repository:
```
git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
homeshick clone git@github.com:keichi/dotfiles.git
```

Install Homebrew, homebrew-bundle and formulae:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --global
```

Install neovim (Linux):
```
curl -sL https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.tar.gz | tar -C $HOME/.local  --strip-components 1 -xzvf -
```

Install rustup if needed:

```
rustup-init
```

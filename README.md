# dotfiles

## Installation

Install Xcode tools and agree to its license:
```
$ sudo xcode-select --install
$ sudo xcrun cc
```

Install homeshick and clone this repository:
```
$ git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
$ source "$HOME/.homesick/repos/homeshick/homeshick.sh"
$ homeshick clone git@github.com:keichi/dotfiles.git
```

Install Homebrew, homebrew-bundle and formulae:
```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew bundle --global
```

Install TPM
```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install vim-plug and vim plugins:
```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$ vim # Run :PlugInstall
```

Install rustup if needed:
```
$ rustup-init
```

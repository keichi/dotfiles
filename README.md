# dotfiles

## Installation

1. Install Xcode tools and agree to its license
```
$ sudo xcode-select --install
$ sudo xcrun cc
```

2. Install homeshick and clone this repositroy
```
$ git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
$ source "$HOME/.homesick/repos/homeshick/homeshick.sh"
$ homesick clone git@github.com:keichi/dotfiles.git
```

3. Install Homebrew, homebrew-bundle and formulae
```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew tap Homebrew/bundle
$ brew bundle --global
```

4. Install vim-plug and vim plugins
```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$ vim # Run :PlugInstall
```

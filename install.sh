#!/bin/bash

populate () {
  cd ~/dotfiles
  for i in {zshrc,vimrc,screenrc,gitconfig}
  do
    ln -sf ~/dotfiles/$i ~/.${i}
  done
  mkdir -p ~/.config/ghostty
  ln -sf ~/dotfiles/ghostty.cfg ~/.config/ghostty/config
}

install_ohmyzsh () {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  curl -fsSL https://gist.githubusercontent.com/cprimera/6226629/raw/0e9cd73e48d2a967ead3514aaaba187242eff48b/cprimera.zsh-theme > ~/.oh-my-zsh/themes/cprimera.zsh-theme
}

if [ ! -d "${HOME}/dotfiles" ]
then
  git clone https://github.com/cprimera/dotfiles ~/dotfiles
fi

install_ohmyzsh
populate
if command -v brew 2>&1 >/dev/null
then
    brew bundle install
fi
if [ "`uname -s`" == "Darwin" ]
then
    ~/dotfiles/osx
fi

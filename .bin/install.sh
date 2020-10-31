#!/usr/bin/env bash

## Check if command exists
function existsCmd () {
  type -a $1 > /dev/null 2>&1
}

## brew
if ! existsCmd brew;
then
  echo '[info][brew] brew does not exist'
  echo '[info][brew] install it…'
  command /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo '[info][brew] brew already exists'
  echo '[info][brew] updating brew'
  command brew update
fi

## nodebrew
if ! existsCmd nodebrew;
then
  echo '[info][nodebrew] does not exist'
  echo '[info][nodebrew] install it…'
  command brew install nodebrew
else
  echo '[info][nodebrew] already exists. skip.'
fi

## git
if ! existsCmd git; then
  echo '[info][git] does not exist'
  echo '[info][git] install it…'
  command brew install git
else
  echo '[info][git] already exists'
fi

## exa
if ! existsCmd exa; then
  echo '[info][exa] exa does not exist'
  echo '[info][exa] install it…'
  command brew install exa
else
  echo '[info][exa] exa already exists'
fi

## starship
if ! existsCmd starship; then
  echo '[info][starship] starship does not exist'
  echo '[info][starship] install it…'
  command brew install starship
else
  echo '[info][starship] starship already exists'
fi
echo '[info][starship] deploy file'
command mkdir ~/.config
command cp ./files/.config/starship.toml ~/.config/


## zsh
if ! existsCmd zsh; then
  echo '[info][zsh] zsh does not exist'
  echo '[info][zsh] install it…'
  command brew install zsh
else
  echo '[info][zsh] zsh already exists'
fi
echo '[info][vim] deploy .zshrc'
command cp ./files/.zshrc ~/

## Peco
if ! existsCmd peco; then
  echo '[info][peco] peco does not exist'
  echo '[info][peco] install it…'
  command brew install peco
else
  echo '[info][peco] peco already exists'
fi

## vim
echo '[info][vim] deploy files'
command cp ./files/.vimrc ~/
command mkdir -p ~/.vim/colors/
command cp ./files/.vim/colors/molokai.vim ~/.vim/colors/

## Load files
echo '[info][files] load files'
command source ~/.zshrc

#!/usr/bin/env bash

## Check if command exists
function existsCmd () {
  type -a $1 > /dev/null 2>&1
}

## brew
if ! existsCmd brew;
then
  echo '[info] brew does not exist'
  echo '[info] install it…'
  command /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo '[info] brew already exists'
  echo '[info] updating brew'
  command brew update
fi

## exa
if ! existsCmd exa; then
  echo '[info] exa does not exist'
  echo '[info] install it…'
  command brew install exa
else
  echo '[info] exa already exists'
fi

## starship
if ! existsCmd starship; then
  echo '[info] starship does not exist'
  echo '[info] install it…'
  command brew install starship
else
  echo '[info] starship already exists'
fi
echo '[info] put starship.toml'
command mkdir ~/.config
command cp ./starship.toml ~/.config/starship.toml

## zsh
if ! existsCmd zsh; then
  echo '[info] zsh does not exist'
  echo '[info] install it…'
  command brew install zsh
else
  echo '[info] zsh already exists'
fi
echo '[info] put .zshrc'
command cp ./.zshrc ~/

## Peco
if ! existsCmd peco; then
  echo '[info] peco does not exist'
  echo '[info] install it…'
  command brew install peco
else
  echo '[info] peco already exists'
fi
#!/usr/bin/env zsh

dir=`dirname $0`
. ${dir}/mac-apps.sh
. ${dir}/vars.sh

## Check if command exists
function existsCmd () {
  type -a $1 > /dev/null 2>&1
}

COMMANDS=('nodebrew' 'git' 'exa' 'starship' 'zsh' 'peco')

## brew
if ! existsCmd brew;
then
  command printf "${ESC}[${GREEN}%s${ESC}[m\n" "[info][brew] does not exist"
  command printf "${ESC}[${GREEN}%s${ESC}[m\n" "[info][brew] install it..."
  command /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  command printf "${ESC}[${GREEN}%s${ESC}[m\n" "[info][brew] already exists"
  command printf "${ESC}[${GREEN}%s${ESC}[m\n" "[info][brew] updating brew..."
  command brew update
fi

for v in "${COMMANDS[@]}"
do
  if ! existsCmd $v;
  then
    command printf "${ESC}[${GREEN}%s${ESC}[m\n" "[info][$v] does not exist"
    command printf "${ESC}[${GREEN}%s${ESC}[m\n" "[info][$v] installing it..."
    command brew install $v
  else
    command printf "${ESC}[${GREEN}%s${ESC}[m\n" "[info][$v] already exists"
  fi
done

## starship
command printf "${ESC}[${GREEN}%s${ESC}[m\n" "[info][starship] deploy file"
command mkdir ~/.config
command cp ./files/.config/starship.toml ~/.config/


## zsh
command printf "${ESC}[${GREEN}%s${ESC}[m\n" "[info][zsh] deploy .zshrc"
command cp ./files/.zshrc ~/
command chsh -s /bin/zsh
command source ~/.zshrc

## vim
command printf "${ESC}[${GREEN}%s${ESC}[m\n" "[info][vim] deploy files"
command cp ./files/.vimrc ~/
command mkdir -p ~/.vim/colors/
command cp ./files/.vim/colors/molokai.vim ~/.vim/colors/

## Mac Apps
installApps
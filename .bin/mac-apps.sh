#!/usr/bin/env bash

dir=`dirname $0`
. ${dir}/vars.sh

function existsApp () {
  brew list --cask $1 > /dev/null 2>&1
}

APPS=('google-chrome' 'firefox' 'iterm2' 'postman' 'spotify' 'visual-studio-code' 'atom' 'toggl-track' 'slack' 'keepingyouawake' 'clipy')

function installApps () {
  command printf "${ESC}[36m%s${ESC}[m\n" 'Installing Mac Apps'
  for v in "${APPS[@]}"
  do
    if ! existsApp $v;
    then
      command printf "${ESC}[${GREEN}%s${ESC}[m\n" "[info][$v] does not exist"
      command printf "${ESC}[${GREEN}%s${ESC}[m\n" "[info][$v] installing it…"
      command brew cask install $v
    else
      command printf "${ESC}[${GREEN}%s${ESC}[m\n" "[info][$v] already exists"
    fi
  done
}
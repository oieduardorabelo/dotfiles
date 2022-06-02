#!/bin/bash

## ########################################
## bat > cat
## ########################################
alias cat='bat'

## ########################################
## vim
## ########################################
alias svim='sudo vim'

## ########################################
## yarn
## ########################################
alias yr='yarn'
alias yra='yarn add'
alias yri='yarn install'
alias yrif='yarn install --force'
alias yrl='yarn list'
alias yro='yarn outdated'
alias yrt='yarn init -y'
alias yru='yarn upgrade-interactive'
alias yrw='yarn workspace'
alias yrg='yarn global'
alias yrgl='yarn global list'

## ########################################
## npm
## ########################################
alias npi='npm install'
alias npl='npm ls --depth=0'
alias npo='npm outdated'
alias npr='npm run'
alias npt='npm init -y'
alias npci='npm ci'
alias npg='npm --location=global'
alias npig='npm install --location=global'
alias npog='npm outdated --location=global'
alias nplg='npm ls --depth=0 --location=global'

## ########################################
# ssh
## ########################################
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '\\n\\r\\033[2K  [ \\033[00;32mPublic key copied to pasteboard.\\033[0m ] id_rsa.pub\\n\\n'"

## ########################################
# misc
## ########################################
alias grep="grep --color=auto"
alias less="less -r"
alias dotfilesconfig='e ~/.dotfiles'
alias bashconfig='e ~/.bash_profile'
alias gitconfig='e ~/.gitconfig'
alias hostsfile='e /etc/hosts'
alias cafe!='echo wake up... && caffeinate'

## ########################################
# navigation
## ########################################
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias c="cd ~/"
alias d="cd ~/Desktop"
alias p="cd ~/Projects"
alias dl="cd ~/Downloads"

## ########################################
## clear the console via terminal
## same as cmd+k, macos only
## ########################################
k() {
  printf '\33c\e[3J'
}

## ########################################
# put mac to sleep via terminal
## ########################################
alias sleepnow="pmset sleepnow"

## ########################################
## grc overides for ls
##   made possible through contributions from generous benefactors like
##   `brew install coreutils`
## ########################################
if gls &>/dev/null; then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la="gls -A --color"
else
  alias ls="ls -F"
  alias l="ls -lAh"
  alias ll="ls -l"
  alias la="ls -A"
fi

## ########################################
## git
## ########################################
alias g='git'
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gds='git diff --staged'
alias gc='git commit'
alias gco='git checkout'
alias gb='git branch'
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias gs='git status -sb'
alias gcb='git copy-branch-name'
alias gm='git merge'

## ########################################
## add git completion to aliases
## ########################################
__git_complete g __git_main
__git_complete gb _git_branch
__git_complete gc _git_commit
__git_complete gco _git_checkout
__git_complete gm _git_merge
__git_complete gp _git_push
__git_complete gl _git_pull

git_ignore_locally() {
  git update-index --assume-unchanged "$1";
}

git_find_in_history() {
  git log --all --full-history -- "$1"
}

## ########################################
## react-native
## ########################################
alias rn='react-native'
alias rns='react-native start'
alias rnlink='react-native link'

alias rnand='react-native run-android'
alias rnios='react-native run-ios'
alias rnios4s='react-native run-ios --simulator "iPhone 4s"'
alias rnios5='react-native run-ios --simulator "iPhone 5"'
alias rnios5s='react-native run-ios --simulator "iPhone 5s"'
alias rnios6='react-native run-ios --simulator "iPhone 6"'
alias rnios6s='react-native run-ios --simulator "iPhone 6s"'

alias rnland='react-native log-android'
alias rnlios='react-native log-ios'

## ########################################
## docker
## ########################################
docker_start() {
  docker-machine start default
  docker-machine env default
  eval "$(docker-machine env default)"
}
alias dr="docker"
alias drc="docker-compose"
alias drm="docker-machine"

## ########################################
## device simulators
## ########################################
open_android_emulator() {
  emulator @Pixel_API_28
}

open_ios_simulator() {
  open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/
}

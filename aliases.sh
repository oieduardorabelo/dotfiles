#!/bin/bash

# vim
alias svim='sudo vim'

# npm
alias npi='npm install'
alias npl='npm ls --depth=0'
alias npo='npm outdated'
alias npr='npm run'
alias npt='npm init -y'

# ssh
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '\n\r\033[2K  [ \033[00;32mPublic key copied to pasteboard.\033[0m ] id_rsa.pub\n\n'"

# misc
alias grep="grep --color=auto"
alias less="less -r"
alias dotfilesconfig='e ~/.dotfiles'
alias bashconfig='e ~/.bash_profile'
alias gitconfig='e ~/.gitconfig'
alias hostsfile='e /etc/hosts'
alias cafe!='echo wake up... && caffeinate'

# navigation
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias c="cd ~/"
alias d="cd ~/Desktop"
alias p="cd ~/Projects"
alias dl="cd ~/Downloads"
alias k="clear"

# put mac to sleep via terminal
alias sleepnow="pmset sleepnow"

# grc overides for ls
#   made possible through contributions from generous benefactors like
#   `brew install coreutils`
if gls &>/dev/null; then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la="gls -A --color"
else
  alias ls="ls -F --color"
  alias l="ls -lAh --color"
  alias ll="ls -l --color"
  alias la="ls -A --color"
fi

# git
alias g='git'
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
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

# add git completion to aliases
__git_complete g __git_main
__git_complete gb _git_branch
__git_complete gco _git_checkout
__git_complete gm _git_merge
__git_complete gp _git_push
__git_complete gl _git_pull

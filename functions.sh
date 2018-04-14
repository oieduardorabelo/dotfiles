#!/bin/bash

# find a running proccess
check() {
  pgrep -f "$1"
}

# checks if the port is in use
port() {
  lsof -n -i4TCP:"$1"
}

# Reloading .bash_profile
reload() {
  echo -e "\\nReloading bash...\\n"
  # shellcheck disable=SC1090,SC1091
  . "$HOME/.bash_profile"
  k
}

# npm bash local packages bin
npm-do() {
  # shellcheck disable=SC2030
  (PATH=$(npm bin):$PATH; eval "$@";)
}

# Ruby
gembump() {
  echo "Running gem --system for: $(ruby -e 'print RUBY_VERSION')..."
  gem update --system
  echo "Updating..."
  gem update
  echo "Cleaning your mess..."
  gem cleanup
  echo "Done."
}

#Homebrew
brewbump() {
  echo -e "\\nUpdating Homebrew...\\n"
  brew update
  echo -e "\\nUpgrading Homebrew...\\n"
  brew upgrade
  echo -e "\\nCleaning your mess...\\n"
  brew cleanup
  brew prune
  echo -e "\\nDone.\\n"
}

# Yarn & NPM lockfiles
genyarnlock() {
  echo -e "\\nyarn task started....\\n"
  echo -e "\\nDeleting node modules....\\n"
  rm -rf node_modules &&
  echo -e "\\nDeleting yarn.lock....\\n"
  rm -rf yarn.lock &&
  echo -e "\\nRunning yarn install....\\n"
  yarn install
  echo -e "\\nyarn task done\\n"
}

gennpmlock() {
  echo -e "\\nnpm task started....\\n"
  echo -e "\\nDeleting node modules....\\n"
  rm -rf node_modules &&
  echo -e "\\nDeleting package-lock.json....\\n"
  rm -rf package-lock.json &&
  echo -e "\\nRunning npm install....\\n"
  npm install
  echo -e "\\nnpm task done\\n"
}

genlockfiles() {
  gennpmlock && genyarnlock
}

nuke_node_modules() {
  find . -name node_modules -type d -prune -exec rm -rf '{}' +
}

nuke_logs() {
  find . -name "*.log" -type f -prune -exec rm -rf '{}' +
}

# Usage: extract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
# credit: http://nparikh.org/notes/zshrc.txt
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)  tar -jxvf "$1"                        ;;
      *.tar.gz)   tar -zxvf "$1"                        ;;
      *.bz2)      bunzip2 "$1"                          ;;
      *.dmg)      hdiutil mount "$1"                    ;;
      *.gz)       gunzip "$1"                           ;;
      *.tar)      tar -xvf "$1"                         ;;
      *.tbz2)     tar -jxvf "$1"                        ;;
      *.tgz)      tar -zxvf "$1"                        ;;
      *.zip)      unzip "$1"                            ;;
      *.ZIP)      unzip "$1"                            ;;
      *.pax)      pax -r < "$1"                         ;;
      *.pax.Z)    uncompress "$1" --stdout | pax -r     ;;
      *.Z)        uncompress "$1"                       ;;
      *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

ppath() {
  # shellcheck disable=SC2031
  tr : '\n' <<< "$PATH"
}

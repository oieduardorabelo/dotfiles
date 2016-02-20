#!/bin/bash

# Reloading .bash_profile
reload() {
  echo -e "\nReloading bash...\n"
  # shellcheck disable=SC1090,SC1091
  . "$HOME/.bash_profile"
  clear
}

# npm bash local packages bin
npm-do() {
  (PATH=$(npm bin):$PATH; eval "$@";)
}

# Ruby
gembump() {
  echo "Updating Gems for: $(ruby -e 'print RUBY_VERSION')..."
  gem update
  echo "Cleaning your mess..."
  gem cleanup
  echo "Done."
}

#Homebrew
brewbump() {
  echo -e "\nUpdating Homebrew...\n"
  brew update
  echo -e "\nUpgrading Homebrew...\n"
  brew upgrade --all
  echo -e "\nCleaning your mess...\n"
  brew cleanup
  echo -e "\nDone.\n"
}

# Usage: extract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
# credit: http://nparikh.org/notes/zshrc.txt
extract () {
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

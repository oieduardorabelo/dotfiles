#!/bin/bash

# Install dotfiles.

if [ -d ~/.dotfiles ]; then
  printf "\nThe '~/.dotfiles' folder already exists, please, backup it and run this again!\n\n"
  exit 1
fi

git clone --recursive https://github.com/oieduardorabelo/dotfiles ~/.dotfiles

cd ~/.dotfiles

bash bin/_common-dependencies
bash bin/_setup-gitconfig
bash bin/_copy-symlinks

echo "All done! Please, restart your terminal session!"

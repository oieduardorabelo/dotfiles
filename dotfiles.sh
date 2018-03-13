#!/bin/bash

# exports
if [[ ! "$EDITOR" ]]; then
  export EDITOR='subl'
fi

export PATH="$PATH:$HOME/.dotfiles/bin"

export DOTFILES_ROOT="$HOME/.dotfiles"

# bash-completion
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  # shellcheck disable=SC1090,SC1091
  . "$(brew --prefix)/etc/bash_completion"
fi

# GRC colorizes nifty unix tools all over the place
if test "$(which grc)"; then
  # shellcheck disable=SC1090,SC1091
  . "$(brew --prefix)/etc/grc.bashrc"
fi

# nvm / node
if [[ ! "$CUSTOM_NODE_PATH" ]]; then
  CUSTOM_NODE_PATH="$HOME/.nvm/versions/node/v8.10.0/bin"
fi

nvm() {
    if [ -f "$(brew --prefix nvm)/nvm.sh" ]; then
      # shellcheck disable=SC1090,SC1091
      . "$(brew --prefix nvm)/nvm.sh"
    fi
}
export NVM_DIR="$HOME/.nvm"
export NODE_PATH="$CUSTOM_NODE_PATH"

# rbenv
if test "$(which rbenv)"; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# shellcheck disable=SC1090,SC1091
. "$DOTFILES_ROOT/aliases.sh"

# shellcheck disable=SC1090,SC1091
. "$DOTFILES_ROOT/functions.sh"

# shellcheck disable=SC1090,SC1091
. "$DOTFILES_ROOT/ps1.sh"

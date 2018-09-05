#!/bin/bash

function addToPATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

# exports
if [[ ! "$EDITOR" ]]; then
  export EDITOR='subl'
fi

export DOTFILES_ROOT="$HOME/.dotfiles"

addToPATH "$DOTFILES_ROOT/bin"

# bash-completion
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  # shellcheck disable=SC1090,SC1091
  . "$(brew --prefix)/etc/bash_completion"
fi

# GRC colorizes nifty unix tools all over the place
if test "$(command -v grc)"; then
  # shellcheck disable=SC1090,SC1091
  . "$(brew --prefix)/etc/grc.bashrc"
fi

# nvm / node
if [[ ! "$CUSTOM_NODE_PATH" ]]; then
  CUSTOM_NODE_PATH="$HOME/.nvm/versions/node/v8.11.4/bin"
fi

nvm() {
    if [ -f "$(brew --prefix nvm)/nvm.sh" ]; then
      # shellcheck disable=SC1090,SC1091
      . "$(brew --prefix nvm)/nvm.sh"
    fi
}
export NVM_DIR="$HOME/.nvm"
export NODE_PATH="$CUSTOM_NODE_PATH"

addToPATH "$NODE_PATH"

# rbenv
if test "$(command -v rbenv)"; then
  addToPATH "$HOME/.rbenv/bin"
  addToPATH "$HOME/.rbenv/shims"
fi

# shellcheck disable=SC1090,SC1091
. "$DOTFILES_ROOT/aliases.sh"

# shellcheck disable=SC1090,SC1091
. "$DOTFILES_ROOT/functions.sh"

# shellcheck disable=SC1090,SC1091
. "$DOTFILES_ROOT/ps1.sh"

#!/bin/bash
function addToPATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

# env exports
export BAT_THEME="OneHalfLight"
export DOTFILES_BREW_PREFIX="$(brew --prefix)"
export DOTFILES_ROOT="$HOME/.dotfiles"

if [[ ! "$EDITOR" ]]; then
  export EDITOR='subl'
fi

if [[ ! "$CUSTOM_NODE_PATH" ]]; then
  CUSTOM_NODE_PATH="$HOME/.nvm/versions/node/v8.12.0/bin"
fi
export NODE_PATH="$CUSTOM_NODE_PATH"

export NVM_DIR="$HOME/.nvm"

# local -x
addToPATH "$DOTFILES_ROOT/bin"

# node
addToPATH "$NODE_PATH"

# rbenv
addToPATH "$HOME/.rbenv/bin"
addToPATH "$HOME/.rbenv/shims"

# bash-completion
if [ -f "$DOTFILES_BREW_PREFIX/etc/bash_completion" ]; then
  # shellcheck disable=SC1090,SC1091
  . "$DOTFILES_BREW_PREFIX/etc/bash_completion"
fi

nvm() {
  if [ -f "$DOTFILES_BREW_PREFIX/opt/nvm/nvm.sh" ]; then
    # shellcheck disable=SC1090,SC1091
    . "$DOTFILES_BREW_PREFIX/opt/nvm/nvm.sh"
  fi
}

# GRC colorizes nifty unix tools all over the place
if [ -f "$DOTFILES_BREW_PREFIX/bin/grc" ]; then
  # shellcheck disable=SC1090,SC1091
  . "$DOTFILES_BREW_PREFIX/etc/grc.bashrc"
fi

# shellcheck disable=SC1090,SC1091
. "$DOTFILES_ROOT/aliases.sh"

# shellcheck disable=SC1090,SC1091
. "$DOTFILES_ROOT/functions.sh"

# shellcheck disable=SC1090,SC1091
. "$DOTFILES_ROOT/ps1.sh"

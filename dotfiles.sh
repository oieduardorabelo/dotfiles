#!/bin/bash
function addToPATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$PATH:$1";; # or PATH="$PATH:$1"
  esac
}

# env exports
DOTFILES_BREW_PREFIX="$(brew --prefix)"
export DOTFILES_BREW_PREFIX
export BAT_THEME="OneHalfLight"
export DOTFILES_ROOT="$HOME/.dotfiles"
export ANDROID_HOME=$HOME/Library/Android/sdk

if [[ ! "$EDITOR" ]]; then
  export EDITOR='subl'
fi

if [[ ! "$CUSTOM_NODE_PATH" ]]; then
  CUSTOM_NODE_PATH="$HOME/.nvm/versions/node/v10.15.0/bin"
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

# Android Studio
addToPATH "$ANDROID_HOME/emulator"
addToPATH "$ANDROID_HOME/tools"
addToPATH "$ANDROID_HOME/tools/bin"
addToPATH "$ANDROID_HOME/platform-tools"

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

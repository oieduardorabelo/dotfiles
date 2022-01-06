#!/bin/bash
function appendToPATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$PATH:$1";; # or PATH="$PATH:$1"
  esac
}

function prependToPATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
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
  CUSTOM_NODE_PATH="$HOME/.nvm/versions/node/v14.18.2/bin"
fi
export NODE_PATH="$CUSTOM_NODE_PATH"

export NVM_DIR="$HOME/.nvm"

appendToPATH "/usr/local/sbin"

# local -x
appendToPATH "$DOTFILES_ROOT/bin"

# node
appendToPATH "$NODE_PATH"

# rbenv
prependToPATH "$HOME/.rbenv/bin"
prependToPATH "$HOME/.rbenv/shims"

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
appendToPATH "$ANDROID_HOME/emulator"
appendToPATH "$ANDROID_HOME/tools"
appendToPATH "$ANDROID_HOME/tools/bin"
appendToPATH "$ANDROID_HOME/platform-tools"

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

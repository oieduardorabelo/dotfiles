# exports
export EDITOR='subl'
export PATH="$HOME/.dotfiles/bin:$PATH"

# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# GRC colorizes nifty unix tools all over the place
if grc &>/dev/null && ! brew &>/dev/null; then
  . "$(brew --prefix)/etc/grc.bashrc"
fi

# nvm
if test "$(which nvm)"; then
  export NVM_DIR=~/.nvm
  . $(brew --prefix nvm)/nvm.sh
fi

# rbenv
if test "$(which rbenv)"; then
  eval "$(rbenv init -)"
fi

. "$(dirname "${BASH_SOURCE[0]}" )/aliases.sh"
. "$(dirname "${BASH_SOURCE[0]}" )/functions.sh"
. "$(dirname "${BASH_SOURCE[0]}" )/ps1.sh"

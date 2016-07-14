#!/bin/bash

#Prompt and prompt colors
# 30m - Black
# 31m - Red
# 32m - Green
# 33m - Yellow
# 34m - Blue
# 35m - Purple
# 36m - Cyan
# 37m - White
# 0 - Normal
# 1 - Bold

# BLACK="\[\033[0;30m\]"
# BLACKBOLD="\[\033[1;30m\]"
RED="\[\033[0;31m\]"
# REDBOLD="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
# GREENBOLD="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
YELLOWBOLD="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
BLUEBOLD="\[\033[1;34m\]"
# PURPLE="\[\033[0;35m\]"
PURPLEBOLD="\[\033[1;35m\]"
# CYAN="\[\033[0;36m\]"
# CYANBOLD="\[\033[1;36m\]"
WHITE="\[\033[0;37m\]"
WHITEBOLD="\[\033[1;37m\]"
RESET='\[\e[0m\]'

v1() {
  # shellcheck disable=SC2016
  git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
  export PS1="$BLUEBOLD\u$RESET at $YELLOWBOLD\h$RESET in $PURPLEBOLD\w$RESET $git_branch"
}

v2() {
  # PS1
  export PS1="$RED\$(ruby -e 'print RUBY_VERSION') $GREEN\$(node --version) $BLUEBOLD\$(npm --version) $YELLOWBOLD\w$BLUEBOLD\$(__git_ps1)$RESET \$ "
}

if [ "$DOTFILES_PS1" == "v1" ]; then
  v1
else
  v2
fi

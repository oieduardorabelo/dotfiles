#PS1
ps1() {
  local yellow='\[\e[33;1m\]'
  local lightBlue='\[\e[1;34m\]'
  local purple='\[\e[1;36m\]'
  local reset='\[\e[0m\]'
  local git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
  export PS1="$lightBlue\u$reset at $yellow\h$reset in $purple\w$reset $git_branch"
}

ps1

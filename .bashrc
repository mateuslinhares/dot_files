if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"
export HISTCONTROL=ignoredups # don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoreboth # ... and ignore same sucessive entries.

# Colours
BLUE="\[\033[0;34m\]"
LIGHT_BLUE="\[\033[1;34m\]"
NO_COLOR="\[\e[0m\]"
GRAY="\[\033[1;30m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GRAY="\[\033[0;37m\]"
LIGHT_GREEN="\[\033[1;32m\]"
LIGHT_RED="\[\033[1;31m\]"
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
WHITE="\[\033[0;37m\]"
YELLOW="\[\033[0;33m\]"
NICE_BLUE="\[\033[1;36m\]"
LIGHT_YELLOW="\[\033[1;33m\]"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

function tabname {
  printf "\e]1;$1\a"
}

function winname {
  printf "\e]2;$1\a"
}

git-prompt () {
  local BRANCH=`git branch 2> /dev/null | grep \* | sed 's/* //'`
  local STATUS=`git status 2>/dev/null`
  local PROMPT_COLOR=$GREEN
  local STATE=" "
  local BEHIND="# Your branch is behind"
  local AHEAD="# Your branch is ahead"
  local UNTRACKED="# Untracked files"
  local DIVERGED="have diverged"
  local CHANGED="# Changed but not updated"
  local TO_BE_COMMITED="# Changes to be committed"

  if [ "$BRANCH" != "" ]; then
    if [[ "$STATUS" =~ "$DIVERGED" ]]; then
      PROMPT_COLOR=$RED
      STATE="${STATE}${RED}↕${NO_COLOR}"
    elif [[ "$STATUS" =~ "$BEHIND" ]]; then
      PROMPT_COLOR=$RED
      STATE="${STATE}${RED}↓${NO_COLOR}"
    elif [[ "$STATUS" =~ "$AHEAD" ]]; then
      PROMPT_COLOR=$RED
      STATE="${STATE}${RED}↑${NO_COLOR}"
    elif [[ "$STATUS" =~ "$CHANGED" ]]; then
      PROMPT_COLOR=$RED
      STATE=""
    elif [[ "$STATUS" =~ "$TO_BE_COMMITED" ]]; then
      PROMPT_COLOR=$RED
      STATE=""
    else
      PROMPT_COLOR=$LIGHT_GREEN
      STATE=""
    fi

    if [[ "$STATUS" =~ "$UNTRACKED" ]]; then
      STATE=" ${STATE}${LIGHT_YELLOW}*${NO_COLOR}"
    fi

    PS1="$NO_COLOR[$LIGHT_BLUE\w$NO_COLOR]${NO_COLOR}(${PROMPT_COLOR}${BRANCH}${NO_COLOR}${STATE}) " # (${YELLOW}$(rvm_version)${NO_COLOR})\n$ "
  else
    PS1="$NO_COLOR[$LIGHT_BLUE\w$NO_COLOR]${NO_COLOR} " # (${YELLOW}$(rvm_version)${NO_COLOR})\n\$ "
  fi
}
PROMPT_COMMAND=git-prompt

[[ -s "/Users/mateuslinhares/.rvm/scripts/rvm" ]] && source "/Users/mateuslinhares/.rvm/scripts/rvm"  # This loads RVM into a shell session.

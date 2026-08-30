#!/bin/bash
# shellcheck disable=SC1090

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Disable C-s/C-q
stty -ixon

# History
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend

# General
shopt -s checkwinsize
shopt -s globstar

# Env
[ -f "$HOME/.env" ] && source "$HOME/.env"

# Aliases
ALIAS_PATH=(
  "$HOME/.aliases"
  "$HOME/.bash_aliases"
)

for path in "${ALIAS_PATH[@]}"; do
  [ -f "$path" ] && source "$path"
done

# PS1
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

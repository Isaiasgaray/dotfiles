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

# Language
export LANG=en_US.utf8
export LANGUAGE=en_US

# General
shopt -s checkwinsize
shopt -s globstar

# Aliases
source_if_exists() {
  if [ -f "$1" ]; then
    source "$1"
  fi
}

source_if_exists "$HOME/.aliases"
source_if_exists "$HOME/.bash_aliases"

#!/usr/bin/env bash

if ! command -v stow &> /dev/null; then
  echo "Error: GNU Stow is not installed." >&2
  exit 1
fi

# Change to the directory where this script is located.
cd "$(dirname "${BASH_SOURCE[0]}")" || exit

PROGRAMS=(
  bash
  git
  tmux
  shell
)

for program in "${PROGRAMS[@]}"; do
  echo "Stowing: $program"
  stow --target "$HOME" "${program}"
  echo "---"
done

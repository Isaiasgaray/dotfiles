#!/usr/bin/env bash

if ! command -v stow &> /dev/null; then
  echo "Error: GNU Stow is not installed." >&2
  exit 1
fi

PROGRAMS=(
  bash
  tmux
  shell
)

for program in "${PROGRAMS[@]}"; do
  echo "running: ${program}"
  stow --target "$HOME" "${program}"
  echo "---"
done

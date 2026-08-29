#!/usr/bin/env bash
set -euo pipefail

if ! command -v stow &> /dev/null; then
  echo "Error: GNU Stow is not installed." >&2
  exit 1
fi

PROGRAMS=(
  # bash
  tmux
  shell
)

for program in "${PROGRAMS[@]}"; do
  stow --verbose 2 --target "$HOME" "${program}"
done

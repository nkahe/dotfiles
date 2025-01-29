#!/bin/zsh
# Place this file in home directory and rest of Zsh config files to directory
# below.

local dotdir="$HOME/.config/zsh"
if [[ -f "$dotdir/.zshrc" ]] || [[ -f "$dotdir/zshrc" ]]; then
  export ZDOTDIR="$dotdir"
fi
skip_global_compinit=1

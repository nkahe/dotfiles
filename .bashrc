#!/bin/bash

# For shell Zsh is used mainly, this is just a backup.

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

function source-if-exists() {
  if [ -f "$1" ]; then
      source "$1"
  fi
}

# Helper function to check if command exists.
function has() {
  command -v "$@" &> /dev/null
}

# Source global definitions
source-if-exists "/etc/bashrc"

source-if-exists "$HOME/.bash_profile"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    . "$rc"
  done
fi

if [ -d $HOME/.config/zsh/snippets/ ]; then
  for rc in $HOME/.config/zsh/snippets/*.sh; do
    . "$rc"
  done
fi

# Aliases that are used in Zsh too.
source-if-exists "$HOME/.config/zsh/aliases.sh"

alias his=' history'
alias hist=' history'

# Sensible Bash - An attempt at saner Bash defaults
# Maintainer: mrzool <http://mrzool.cc>
# Repository: https://github.com/mrzool/bash-sensible
# Version: 0.2.2

## GENERAL OPTIONS ##

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

## SANE HISTORY DEFAULTS ##

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Save each line as it gets issued instead of when shell exists giving real-time
# persistence and cross-terminal visibility.
# Don't clobber PROMPT_COMMAND: WezTerm installs bash-preexec and depends on it.
# Append our history sync hook, handling string vs array PROMPT_COMMAND.
if [[ "$(declare -p PROMPT_COMMAND 2>/dev/null)" == declare\ -a* ]]; then
  _has_history_a=0
  for _pc in "${PROMPT_COMMAND[@]}"; do
    [[ "$_pc" == "history -a" ]] && _has_history_a=1 && break
  done
  (( _has_history_a )) || PROMPT_COMMAND+=("history -a")
  unset _has_history_a _pc
else
  case ";${PROMPT_COMMAND-};" in
    *";history -a;"*) ;;
    *) PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }history -a" ;;
  esac
fi

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

## BETTER DIRECTORY NAVIGATION ##

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
# CDPATH="."

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars

# Examples:
# export dotfiles="$HOME/dotfiles"
# export projects="$HOME/projects"
# export documents="$HOME/Documents"

# Load Zoxide
eval "$(zoxide init bash)"

# Load Bash-It.
# https://bash-it.readthedocs.io/en/latest/
# Cool but kinda slow.
# source-if-exists "$BASH_IT"/bash_it.sh

# Bash-It defaults to Vim otherwise.
# bleopt default_keymap=emacs

unset rc

# Fzf key bindings
source-if-exists '/usr/share/fzf/shell/key-bindings.bash'

# Calculator. Show result with 3 desimals.
# noglob because you then don't need "" around calculations.
ca() {
  if has bc; then
    if [[ -z $1 ]]; then
      echo scale=3 | bc -l
    else
      echo "scale=3;$@" | bc -l
    fi
  else
    echo "bc not found."
  fi
}

# Different config than default to show the shell.
if has starship; then
  # export STARSHIP_CONFIG="$HOME/.config/starship-other.toml"
  eval "$(starship init bash)"
fi

# WezTerm ships bash-preexec (precmd_functions/preexec_functions). If something
# overwrote PROMPT_COMMAND after it was installed, force-install it so that
# Starship (and WezTerm integration) actually runs on each prompt.
if [[ "${bash_preexec_imported-}" == "defined" ]] && type -t __bp_install &>/dev/null; then
  if [[ "${PROMPT_COMMAND[*]-}" != *"__bp_precmd_invoke_cmd"* ]]; then
    __bp_install &>/dev/null || true
  fi
fi


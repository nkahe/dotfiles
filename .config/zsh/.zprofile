#!/bin/zsh
# Needs to be named .sh or doesn't work in KDE Plasma.
# Executes commands at *login* shells pre-zshrc, e.g. at system startup.
# /etc/zprofile gets executed before this
# ! settings in /etc/zshrc override these.

# Initialization file. DE should set run this file at startup. Don't put
# anything that outputs something here. Can break things like ssh and scp.
# KDE Plasma: link to ~/.config/plasma-workspace/env

# LESS_TERMCAP_* variables are defined in Environment -Prezto -snippet.

# Helper function: check if command exists.
has() {
  command -v "$@" &> /dev/null
}

# No read access to others by default.
#[[ $EUID != 0 ]] && umask 027

# Set xterm to use 256 color mode if it already isn't.
[[ $TERM = (xterm|xterm-color) ]] && export TERM=xterm-256color

# Note: ~/.local/bin is for npm and pip among others.
[[ -d $home/bin ]] && export PATH="$PATH:$HOME/bin:$HOME/.local/bin"



# Locale -----------------------------------------------------------------------

# First set this lang to all locales.
export LANG="fi_FI.UTF-8"

# Character Type. Determines the locale category for character handling functions.
# Needs to be here.
export LC_CTYPE=$LANG

# Language of applications
export LC_MESSAGES="en_US.UTF-8"


# Zsh --------------------------------------------------------------------------

export HISTORY_IGNORE="(cd -|cd ..|ls|ll|la|pwd|exit|history|trfi*|tren*)"

# Used by OMZ plugins like last-working-dir and completions.
cachedir="${XDG_CACHE_HOME:-$HOME/.cache}"
export ZSH_CACHE_DIR="$cachedir/zsh"

[[ ! -d "$ZSH_CACHE_DIR" ]] && mkdir -p "$ZSH_CACHE_DIR"

# Siirryin käyttämään ~/dotfiles/init_scripts, joka DE:stä käsin ajetaan.
#
# Device-specific settings here.

[[ -f "$ZDOTDIR/.zprofile.priv" ]] && source "$ZDOTDIR/.zprofile.priv"

export ZCALC_HISTFILE="$HOME/.local/state/zsh/zcalc_history"

export _ZO_DATA_DIR="$HOME/.local/state/zsh"

# Default applications  --------------------------------------------------------

if has micro; then
  editor="micro"
elif has nvim; then
  editor="nvim"
elif has vim; then
  editor="vim"
else
  editor="nano"
fi

export EDITOR=$editor
export VISUAL=$editor

has feh && export IMAGEVIEWER='feh'
has zathura && export PDFVIEWER='zathura'

export AUDIOPLAYER="xdg-open"

# if has most; then
  # export PAGER='most'
#else
  export PAGER='less'
  if [[ -f ${XDG_CONFIG_HOME:-${HOME}/.config}/lesskey ]]; then
    local configfile="--lesskey-file ${XDG_CONFIG_HOME:-${HOME}/.config}/lesskey"
  else
    local configfile=''
  fi
  export LESS="--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen \
    --RAW-CONTROL-CHARS $configfile"
  export LESSHISTFILE="$cachedir/.less_history"
  if [[ ! -f "$LESSHISTFILE" ]]; then
    if [[ ! -d "$cachedir" ]]; then
      mkdir -p "$cachedir"
    fi
    :>"$LESSHISTFILE"
  fi
#fi

# Open man pages in Vim/NeoVim. Needs fixing.
# export MANPAGER="$EDITOR -c 'set filetype=man' -"

if has bat; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  # It might also be necessary to set MANROFFOPT="-c" if you experience formatting problems.
  export MANROFFOPT="-c"
  if [[ $OSTYPE == 'darwin'* ]]; then
   export BAT_THEME='Monokai Extended'
  fi
fi

# Other software  -------------------------------------------------------------

has ollama && export OLLAMA_MODELS=/home/ollama/models

has wine && export WINEPREFIX=$HOME/hdd/wine

# Run anacron as user. Note: doesn't start a daemon.
if has anacron && [[ $EUID != 0 ]]; then
  tabfile=$HOME/.config/anacrontab
  spooldir=$HOME/.local/spool/anacron
  if [[ -e "$tabfile" && -d "$spooldir" ]]; then
    /usr/sbin/anacron -s -t "$tabfile" -S "$spooldir"
  fi
fi

if has xbindkeys && ! pgrep xbindkeys &>/dev/null; then
  file="$HOME/.config/xbindkeysrc"
  if [[ -f $file ]] && ! pgrep wayland &>/dev/null; then
    xbindkeys -f "$file"
  fi
fi

has wayland && export MOZ_ENABLE_WAYLAND=1

has cheat && export CHEAT_USE_FZF=true

# FZF by default starts in fullscreen mode, but you can make it start below the cursor with --height option.
has fzf && export FZF_DEFAULT_OPTS='--height 40%'

# export FZF_ALT_C_COMMAND='^[d'

# E:llä koitin laittaa oikea teema käyttöön qt-ohjelmille. Piti näemmä laittaa vielä
# enlightenmentin asetuksista. Xfce:llä ei qt5ct valitti, että on variable asetettu väärin.
# [[ $XDG_SESSION_DESKTOP != KDE ]] && export QT_QPA_PLATFORMTHEME="qt5ct"

# If you want to use DRI2.
# export LIBGL_DRI3_DISABLE=1

# .NET
# export DOTNET_CLI_TELEMETRY_OPTOUT=true

export GREP_COLOR='mt=1;32'

export GEM_HOME="$HOME/.local/rubygems"
[[ -d $GEM_HOME ]] && export PATH="$PATH:$GEM_HOME/bin"

# if has kwallet-query &>/dev/null && has keepassxc &>/dev/null; then
#   kwallet-query -f '' -r '' kdewallet | keepassxc --pw-stdin $HOME/linux/passwd.kdbx
# fi

# GnuPG
# export GNUPGHOME=

# LibreOffice, use gtk.
# export SAL_USE_VCLPLUGIN=gtk

if has task; then
  # Task warrior
  export TASKRC="~/.config/taskrc"
  export TASKDATA="~/MegaSync/task"
fi

# export TLDR_COLOR_BLANK="cyan"
# export TLDR_COLOR_NAME="cyan"
# export TLDR_COLOR_DESCRIPTION="cyan"
# export TLDR_COLOR_EXAMPLE="green"
# export TLDR_COLOR_COMMAND="red"
# export TLDR_COLOR_PARAMETER="cyan"
# export TLDR_CACHE_ENABLED=1
# export TLDR_CACHE_MAX_AGE=720

# Don't populate ~ with historyfile. Ei toimi susella, kun määritellään
# uudestaan /etc/zshrc. on sen sijaan määritelty zshrc:ssä.
# export HISTFILE=$HOME/.local/share/.zsh_history

# Linux utility to configure modifier keys to act as other keys when presse

# NPM: no annoying messages about new versions (package manager handles it).
if has npm; then
  export NO_UPDATE_NOTIFIER
fi

export WGETRC=${XDG_CONFIG_HOME:-$HOME/.config}/wgetrc

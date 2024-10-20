
# Set xterm to use 256 color mode if it already isn't.
[[ $TERM == xterm || $TERM == xterm-color ]] && export TERM=xterm-256color

# Note: ~/.local/bin is for npm and pip among others.
[[ -d $$HOME/bin ]] && export PATH="$PATH:$HOME/bin:$HOME/.local/bin"

export GEM_HOME="$HOME/.local/rubygems"
[[ -d $GEM_HOME ]] && export PATH="$PATH:$GEM_HOME/bin"

# Locale -----------------------------------------------------------------------

# First set this lang to all locales.
export LANG="fi_FI.UTF-8"

# Character Type. Determines the locale category for character handling functions.
# Needs to be here.
export LC_CTYPE=$LANG

# Language of applications
export LC_MESSAGES="en_US.UTF-8"

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

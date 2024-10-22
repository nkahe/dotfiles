
# If terminal is set to xterm, set 256 color mode.
[[ $TERM == xterm || $TERM == xterm-color ]] && export TERM=xterm-256color

[[ -d $HOME/bin ]] && export PATH="$PATH:$HOME/bin:$HOME/.local/bin"

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

# Helper function: check if command exists.
has() {
  command -v "$@" &> /dev/null
}

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

#fi

if has bat; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  # It might also be necessary to set MANROFFOPT="-c" if you experience formatting problems.
  export MANROFFOPT="-c"
  if [[ $OSTYPE == 'darwin'* ]]; then
    export BAT_THEME='Monokai Extended'
  else
    export BAT_THEME='Visual Studio Dark+'
  fi
fi

# Less  ------------------------------------------------------------------------

if [[ -f ${XDG_CONFIG_HOME:-${HOME}/.config}/lesskey ]]; then
  local configfile="--lesskey-file ${XDG_CONFIG_HOME:-${HOME}/.config}/lesskey"
else
  local configfile=''
fi

export LESS="--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen \
  --RAW-CONTROL-CHARS $configfile"
cachedir="${XDG_CACHE_HOME:-$HOME/.cache}"
export LESSHISTFILE="$cachedir/.less_history"

if [[ ! -f "$LESSHISTFILE" ]]; then
  if [[ ! -d "$cachedir" ]]; then
    mkdir -p "$cachedir"
  fi
  :>"$LESSHISTFILE"
fi

# Other application settings  --------------------------------------------------
#
# Code 	Explanation
# mt 	SGR for ms and mc.
# ms 	SGR for non-matching context in line with match.
# mc 	SGR for non-matching context in line with match (-v).
# sl 	SGR for whole selected lines.
# cx 	SGR for whole context lines.
# rv 	boolean that reverses sl and cx.
# fn 	SGR for file names (-H).
# ln 	SGR for line numbers (-n).
# bn 	SGR for byte offsets.
# se 	SGR for separators between line and context fields (: and -).
# ne 	boolean to prevent clearing to eol.

export GREP_COLORS='ms=01;36:mc=01;31:sl=37:cx=01;33:fn=34:ln=94:bn=32:se=36'

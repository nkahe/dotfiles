
# Settings which I'm currently not using anymore (for now).

function source-if-exists() {
  if [ -f "$1" ]; then
      source "$1"
  fi
}

# Ble.sh settings. Could be loaded by Bash-it.A
# [akinomyoga/ble.sh: Bash Line Editor―a line editor written in pure Bash with
# syntax highlighting, auto suggestions, vim modes, etc. for Bash interactive
# sessions. https://github.com/akinomyoga/ble.sh?tab=readme-ov-file
#source "$HOME/.local/share/blesh/ble.sh"
source-if-exists "~/.local/share/blesh/ble.sh"
ble-face auto_complete=fg=240,bg=16 2> /dev/null
ble-face command_builtin=fg=green 2> /dev/null

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Some themes can show whether `sudo` has a current token or not.
# Set `$THEME_CHECK_SUDO` to `true` to check every prompt:
THEME_CHECK_SUDO='true'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
export BASH_IT_REMOTE='bash-it'

# (Advanced): Change this to the name of the main development branch if
# you renamed it or if it was changed for some reason
export BASH_IT_DEVELOPMENT_BRANCH='master'


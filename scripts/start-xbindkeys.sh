
# Start xbindkeys if it's installed and not running.
if command -v xbindkeys &> /dev/null && ! pgrep xbindkeys &>/dev/null
then
  file="$HOME/.config/xbindkeysrc"
  if [[ -f $file ]] && ! pgrep wayland &>/dev/null; then
    xbindkeys -f "$file"
  fi
  unset file
fi

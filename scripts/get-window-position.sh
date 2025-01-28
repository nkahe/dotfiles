#!/bin/bash

# This doesn't include window decorations so doen't work properly.
# xdotool getwindowfocus getwindowgeometry --shell >/tmp/terminal-window

# Get the coordinates of the active window's
#    top-left corner, and the window's size.
#    This excludes the window decoration.

# https://unix.stackexchange.com/questions/14159/how-do-i-find-the-window-dimensions-and-position-accurately-including-decoration

  unset x y w h
  eval $(xwininfo -id $(xdotool getactivewindow) |
    sed -n -e "s/^ \+Absolute upper-left X: \+\([0-9]\+\).*/x=\1/p" \
           -e "s/^ \+Absolute upper-left Y: \+\([0-9]\+\).*/y=\1/p" \
           -e "s/^ \+Width: \+\([0-9]\+\).*/w=\1/p" \
           -e "s/^ \+Height: \+\([0-9]\+\).*/h=\1/p" )
 echo "X=$x;Y=$y" > $HOME/.config/tdrop-position

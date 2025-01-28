#!/bin/sh

# For tdrop to save window position

source $HOME/.config/tdrop-position
xdotool getactivewindow windowmove $X $Y

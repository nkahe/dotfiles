#!/bin/bash

# This script changes input device properties if they are connected.
# Works in X with xinput installed.

# Get ID of given input device.
function get_id() {
  local device_name="$1"
  local device_id
  device_id=$(xinput list | grep "$device_name" | head -n 1 | sed -r 's/.*id=([0-9]+).*/\1/')
  echo "$device_id"
}

if ! command -v xinput >/dev/null || [ -n "$WAYLAND_DISPLAY" ]; then
  exit 0
fi

# Swap button placement for mouse that is used left-handed.

# ID changes. 'xinput list' lists IDs. List buttons: xinput get-button-map
# Button numbers can be checked with 'xinput test <device>'.

# Logitech M180, pieni hiiri, harmaat kaistaleet ja kuminen rulla.
ID=$(get_id 'Logitech M215')
if [ -n "$ID" ]; then
  xinput set-button-map "$ID" 3 2 1 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
  unset "$ID"
fi

ID=$(get_id 'HP HP USB 1000dpi')
if [ -n "$ID" ]; then
  xinput set-button-map "$ID" 3 2 1 4 5 6 7 8 9
  unset "$ID"
fi

# Iso symmetrinen hiiri M510.
ID=$(get_id 'Logitech M510')
if [ -n "$ID" ]; then
  xinput set-button-map "$ID" 3 2 1 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
unset "$ID"
fi

ID=$(get_id 'Logitech K830')
if [ -n "$ID" ]; then
  xinput set-prop "$ID" "libinput Natural Scrolling Enabled" 1
fi

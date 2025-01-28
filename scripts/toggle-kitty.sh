#!/bin/bash

# Get all window information
all_windows=$(qdbus org.kde.KWin /KWin org.kde.KWin.queryWindowInfo)

# Parse the window information to find the Kitty window ID
window_id=""
while read -r line; do
    if [[ "$line" == *"kitty"* ]]; then
        window_id=$(echo "$line" | awk '{print $1}')
        break
    fi
done <<< "$all_windows"

if [ -n "$window_id" ]; then
    # Check if the window is minimized
    minimized=$(qdbus org.kde.KWin /KWin org.kde.KWin.getWindowInfo "$window_id" | grep "Minimized" | awk '{print $3}')

    if [ "$minimized" == "true" ]; then
        # Restore the window
        qdbus org.kde.KWin /KWin org.kde.KWin.unminimizeWindow "$window_id"
        qdbus org.kde.KWin /KWin org.kde.KWin.activateWindow "$window_id"
    else
        # Minimize the window
        qdbus org.kde.KWin /KWin org.kde.KWin.minimizeWindow "$window_id"
    fi
else
    echo "Kitty window not found"
fi

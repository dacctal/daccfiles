#!/usr/bin/env bash

# Grab info about the focused window
win_info=$(hyprctl -j activewindow)

# If no window focused, bail
[ -z "$win_info" ] && exit 0

# Parse out the workspace name
ws_name=$(echo "$win_info" | jq -r '.workspace.name')

if [[ "$ws_name" =~ ^special:sp([0-9]+)$ ]]; then
    # We're in a special workspace, extract the number
    orig_ws="${BASH_REMATCH[1]}"
    # Move window back to its original numbered workspace
    hyprctl dispatch movetoworkspace "$orig_ws"
else
    # We're in a normal workspace, send it to its matching special
    current=$(echo "$win_info" | jq -r '.workspace.id')
    hyprctl dispatch movetoworkspace "special:sp${current}"
fi

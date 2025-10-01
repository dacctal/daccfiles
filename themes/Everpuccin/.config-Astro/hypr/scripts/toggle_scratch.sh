# ~/.config/hypr/scripts/toggle_scratch.sh
#!/usr/bin/env bash
current=$(hyprctl -j monitors | jq '.[] | select(.focused==true).activeWorkspace.id')
hyprctl dispatch togglespecialworkspace "sp${current}"

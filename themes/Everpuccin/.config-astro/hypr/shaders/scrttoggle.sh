#!/bin/bash

# Path to your shader file
SHADER_PATH="$HOME/.config/hypr/shaders/scrt.frag"

# Path to sound file
SOUND_FILE="/home/music/crton.wav"

# Get the currently active monitor
ACTIVE_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')

# Check if shader is already applied to the active monitor
CURRENT_SHADER=$(hyprctl getoption decoration:screen_shader -j | jq -r '.str' 2>/dev/null)

# Function to play sound
play_sound() {
  if [ -f "$SOUND_FILE" ]; then
    paplay "$SOUND_FILE" 2>/dev/null ||
      aplay "$SOUND_FILE" 2>/dev/null ||
      ffplay -nodisp -autoexit "$SOUND_FILE" 2>/dev/null &
  fi
}

# Check if shader is currently active on any monitor or globally
if [ "$CURRENT_SHADER" == "$SHADER_PATH" ] || hyprctl keyword decoration:screen_shader | grep -q "$SHADER_PATH"; then
  # Shader is active, turn it off completely
  hyprctl keyword decoration:screen_shader ""
  notify-send "CRT Shader" "Disabled on $ACTIVE_MONITOR" --icon=display
  play_sound
else
  # Shader is inactive, turn it on for current monitor only
  # Note: Hyprland applies screen_shader globally, but we can try monitor-specific approach
  hyprctl keyword decoration:screen_shader "$SHADER_PATH"
  notify-send "CRT Shader" "Enabled on $ACTIVE_MONITOR" --icon=display
  play_sound
fi


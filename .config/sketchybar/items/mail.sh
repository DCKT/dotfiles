#!/bin/bash

STYLE=(
  label.padding_left=4
  label.font="JetBrainsMonoNL Nerd Font Propo:Bold:16"
  background.corner_radius=6
  background.height=26
  icon.padding_left=10
  background.color=$FLAMINGO
)

sketchybar --add item mail right \
  --set mail update_freq=20 click_script="open /Applications/Airmail.app" \
  icon= \
  script="$PLUGIN_DIR/mail.sh" \
  "${STYLE[@]}"

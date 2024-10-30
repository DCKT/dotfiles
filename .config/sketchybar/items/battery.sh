#!/bin/bash

STYLE=(
  background.color=$SURFACE
  background.height=26
  icon.background.height=26
  icon.padding_left=8
  icon.background.corner_radius=4
  icon.color=$SURFACE
  icon.background.color=$YELLOW
  icon.padding_right=6
  icon.font.size=14.0
  label.padding_left=8
  label.padding_right=8
)

sketchybar --add item battery right \
  --set battery update_freq=120 script="$PLUGIN_DIR/battery.sh" \
  "${STYLE[@]}" \
  --subscribe battery system_woke power_source_change

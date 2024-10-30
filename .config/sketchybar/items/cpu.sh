#!/bin/bash
STYLE=(
  background.color=$SURFACE
  background.height=26
  icon.background.height=26
  icon.padding_left=8
  icon.background.corner_radius=4
  icon.color=$SURFACE
  icon.background.color=$LAVENDER
  icon.padding_right=6
  icon.font.size=16.0
  label.padding_left=8
  label.padding_right=8
)

sketchybar --add item cpu right \
  --set cpu update_freq=5 icon= \
  "${STYLE[@]}" \
  script="$PLUGIN_DIR/cpu.sh"

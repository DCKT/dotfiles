#!/bin/bash

STYLE=(
  background.color=$SURFACE
  background.height=26
  icon.background.height=26
  icon.padding_left=8
  icon.background.corner_radius=4
  icon.color=$SURFACE
  icon.padding_right=6
  icon.font.size=20.0
  label.padding_left=8
  label.padding_right=8
  icon.background.color=$MAROON
)

sketchybar --add item volume right \
  --set volume script="$PLUGIN_DIR/volume.sh" \
  "${STYLE[@]}" \
  --subscribe volume volume_change

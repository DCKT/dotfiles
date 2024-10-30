#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME background.drawing=on label.color=$BASE
else
  sketchybar --set $NAME background.drawing=off label.color=$WHITE
fi

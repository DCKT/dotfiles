#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

COUNT_PERSO=$(himalaya -a Personal -o json | jq length)
COUNT_WORK=$(himalaya -a Work -o json | jq length)
COUNT=$(($COUNT_WORK + $COUNT_PERSO))

if (($COUNT > 0)); then
  sketchybar --set mail background.drawing="on" icon.color=$BASE label.padding_right=8 label.color=$BASE label=$COUNT
else
  sketchybar --set mail background.drawing="off" label="" icon.color=$WHITE
fi

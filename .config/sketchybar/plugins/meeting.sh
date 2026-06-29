#!/bin/bash

event=$(termeeting next -j 2>/dev/null)
title=$(echo "$event" | jq -r '.title // empty')
start=$(echo "$event" | jq -r '.start // empty')
conference=$(echo "$event" | jq -r '.conferenceLink // empty')

WHITE="0xffffffff"
FLAMINGO="0xFFf2cdcd"
BASE="0xe61e1e2e"
SURFACE="0x9c623b20"

if [ -z "$title" ]; then
  sketchybar --set meeting label.drawing=off icon.drawing=off
else
  start_clean=$(echo "$start" | sed 's/\([+-][0-9][0-9]\):\([0-9][0-9]\)$/\1\2/')
  start_epoch=$(date -j -f "%Y-%m-%dT%H:%M:%S%z" "$start_clean" +%s 2>/dev/null)
  now_epoch=$(date +%s)

  if [ "$start_epoch" -gt "$now_epoch" ]; then
    icon_time=$(date -j -f "%s" "$start_epoch" "+%Hh%M")
    sketchybar --set meeting \
      label.drawing=on icon.drawing=on \
      label="$title" \
      icon="$icon_time" \
      icon.background.height=26 \
      icon.background.color="$FLAMINGO" \
      icon.font.size=14.0 \
      icon.padding_right=8 icon.padding_left=8 \
      icon.color="$BASE" \
      icon.background.corner_radius=2 \
      label.background.corner_radius=2 \
      label.background.height=24 \
      label.padding_left=8 label.padding_right=8 \
      label.background.color="$SURFACE" \
      label.color="$WHITE" \
      click_script="open '$conference'"
  else
    sketchybar --set meeting \
      label.drawing=on icon.drawing=off \
      label="$title" \
      label.padding_left=8 \
      label.color=0xe61e1e2e \
      label.background.color=0xFFf2cdcd \
      label.background.height=24 \
      label.background.corner_radius=4 \
      label.font.size=14.0 \
      click_script="open '$conference'"
  fi
fi

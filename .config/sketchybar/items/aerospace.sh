#!/bin/bash

sketchybar --add event aerospace_workspace_change

STYLE=(
  background.color=$MAUVE
  background.corner_radius=4
  label.color=$WHITE
  label.padding_left=2
  label.padding_right=8
  background.height=24
  background.drawing=on
)

for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space.$sid left \
    --subscribe space.$sid aerospace_workspace_change \
    --set space.$sid \
    "${STYLE[@]}" \
    label="$sid" \
    click_script="aerospace workspace $sid" \
    script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done

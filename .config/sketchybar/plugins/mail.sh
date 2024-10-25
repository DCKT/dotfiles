#!/usr/bin/env bash

COUNT=$(himalaya -o json | jq length)

if (($COUNT > 0)); then
  sketchybar --set mail label=$COUNT
else
  sketchybar --set mail background.drawing="off"
fi

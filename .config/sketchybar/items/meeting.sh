#!/bin/bash

sketchybar --add item meeting right \
  --set meeting update_freq=30 \
  script="$PLUGIN_DIR/meeting/getnextmeeting"

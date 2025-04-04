#!/bin/bash

sketchybar --add item meeting center \
  --set meeting update_freq=30 \
  script="$PLUGIN_DIR/meeting/getnextmeeting"

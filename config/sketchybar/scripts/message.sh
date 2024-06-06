#!/usr/bin/env bash

source "$CONFIG_DIR/variables.sh"

# message_content=$(test -e ~/message.txt && cat ~/message.txt)
message_content=$(test -e ~/message.txt && head -n 1 ~/message.txt)
if [[ -n $message_content ]]; then
  sketchybar --set message label="$message_content" background.color="$BACKGROUND_COLOR"
else
  sketchybar --set message label="" background.color="$TRANSPARENT"
fi

#!/bin/bash

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
TEMP_DIR="/tmp"
TEMP_FILE="screenshot_$TIMESTAMP.png"
TEMP_PATH="$TEMP_DIR/$TEMP_FILE"
OUTPUT_DIR="${HOME}/Pictures/screenshots"
ACTION_NAME="EDIT"

mkdir -p "$OUTPUT_DIR"

hyprshot -m region -s -o "$TEMP_DIR" -f "$TEMP_FILE" && wl-copy <"$TEMP_PATH"

if [[ -f "$TEMP_PATH" ]]; then
  ACTION=$(notify-send -w "Screenshot Taken" "Click to edit in Satty." \
    -i "$TEMP_PATH" \
    -u critical \
    -A "$ACTION_NAME=Edit")

  if [ "$ACTION" == "$ACTION_NAME" ]; then
    satty --filename "$TEMP_PATH" --output-filename "$OUTPUT_DIR/screenshot_${TIMESTAMP}.png" --copy-command "wl-copy" --early-exit
  fi
else
  notify-send "Screenshot Cancelled" "No screenshot taken." -t 2000
fi

#!/bin/bash

# Define virtual or unwanted sinks to skip (space-separated exact names or patterns)
EXCLUDED_SINKS=(
  "easyeffects_sink"
  "easyeffects_source"
  # Add any other sinks you want to ignore here
)

# Function to check if a sink is in the exclusion list
is_excluded() {
  local sink="$1"
  for excluded in "${EXCLUDED_SINKS[@]}"; do
    if [[ "$sink" == "$excluded" ]] || [[ "$sink" == *"$excluded"* ]]; then
      return 0 # True: excluded
    fi
  done
  return 1 # False: keep
}

# Get all sinks and filter out the excluded ones
ALL_SINKS=$(pactl list short sinks | awk '{print $2}')
FILTERED_SINKS=()

for sink in $ALL_SINKS; do
  if ! is_excluded "$sink"; then
    FILTERED_SINKS+=("$sink")
  fi
done

# If no valid sinks are left, exit safely
if [ ${#FILTERED_SINKS[@]} -eq 0 ]; then
  echo "Error: No valid sinks available to switch to."
  exit 1
fi

# Get the current default sink
CURRENT_SINK=$(pactl get-default-sink)

# Find current position within the filtered list
CURRENT_INDEX=-1
for i in "${!FILTERED_SINKS[@]}"; do
  if [[ "${FILTERED_SINKS[$i]}" == "$CURRENT_SINK" ]]; then
    CURRENT_INDEX=$i
    break
  fi
done

# Calculate the next index (wraps around)
NEXT_INDEX=$(((CURRENT_INDEX + 1) % ${#FILTERED_SINKS[@]}))
NEXT_SINK=${FILTERED_SINKS[$NEXT_INDEX]}

# Set the new default sink
pactl set-default-sink "$NEXT_SINK"
echo "Switched default sink to: $NEXT_SINK"

# Move all active audio streams to the new sink
for SINK_INPUT_ID in $(pactl list short sink-inputs | awk '{print $1}'); do
  pactl move-sink-input "$SINK_INPUT_ID" "$NEXT_SINK"
done

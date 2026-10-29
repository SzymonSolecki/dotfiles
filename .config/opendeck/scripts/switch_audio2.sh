#!/bin/bash

# Get a list of all sinks, ordered by index, and extract the sink names
SINK_NAMES=$(pactl list short sinks | awk '{print $2}')
SINK_ARRAY=($SINK_NAMES)

# Get the name of the current default sink
CURRENT_SINK=$(pactl get-default-sink)

# Find the index of the current default sink in the array
CURRENT_INDEX=-1
for i in "${!SINK_ARRAY[@]}"; do
  if [[ "${SINK_ARRAY[$i]}" = "$CURRENT_SINK" ]]; then
    CURRENT_INDEX=$i
    break
  fi
done

# Calculate the index of the next sink (wraps around to 0 if at the end)
NEXT_INDEX=$(((CURRENT_INDEX + 1) % ${#SINK_ARRAY[@]}))
NEXT_SINK=${SINK_ARRAY[$NEXT_INDEX]}

# Set the new default sink
pactl set-default-sink "$NEXT_SINK"
echo "Switched default sink to: $NEXT_SINK"

# Move all active sink inputs (streams) to the new default sink
for SINK_INPUT_ID in $(pactl list short sink-inputs | awk '{print $1}'); do
  pactl move-sink-input "$SINK_INPUT_ID" "$NEXT_SINK"
done

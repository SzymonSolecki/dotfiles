#!/bin/bash

killall -q polybar

while pgrep -x wal > /dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -c ~/.config/polybar/config.ini --reload main &
  done
else
  polybar -c ~/.config/polybar/config.ini --reload main &
fi

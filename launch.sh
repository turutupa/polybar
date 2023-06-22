#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar for each monitor
for m in $(polybar --list-monitors | cut -d":" -f1); do
    # Set the MONITOR environment variable for this instance of polybar
    MONITOR=$m polybar main &
done

echo "Bars launched..."

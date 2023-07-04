#!/bin/bash

# Path to the flag file
flag_file="/home/turutupa/.config/polybar/scripts/date_flag"

if [[ -e "$flag_file" ]]; then
  # If flag file exists, show full date, time and remove flag file
  date '+%{F#a89984} %{F-}   %A, %B   %d %{F#a89984}%{F-}    %H:%M'
  rm "$flag_file"
else
  # If flag file doesn't exist, only show time and create flag file
  date '+%{F#a89984}%{F-}    %H:%M'
  touch "$flag_file"
fi

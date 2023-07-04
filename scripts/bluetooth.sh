#!/bin/bash

icon_enabled="󰂰"
icon_disabled="󰂲"

if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "%{F#4e4e4e}$icon_disabled"
else
  if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
  then 
    echo "%{F#a89984}$icon_enabled"
  fi
    device=$(echo info | bluetoothctl | grep 'Name:' | cut -d ' ' -f 2- | cut -c 1-8)
    echo "%{F#a89984}$icon_enabled%{F-}   $device"
fi

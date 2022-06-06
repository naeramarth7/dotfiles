#!/usr/bin/env bash

COLOR_HIGH=0xffed2985
COLOR_MID=0xff0ad2ff
COLOR_LOW=0xff3cfa50

VALUE=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{print 0+$5}')
sketchybar -m --set usage.mem.value label=$VALUE%

if [ "$VALUE" -ge "75" ]; then
  sketchybar -m --set usage.mem.value label.color=$COLOR_HIGH
elif [ "$VALUE" -ge "50" ]; then
  sketchybar -m --set usage.mem.value label.color=$COLOR_MID
else
  sketchybar -m --set usage.mem.value label.color=$COLOR_LOW
fi

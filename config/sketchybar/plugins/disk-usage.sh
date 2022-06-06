#!/usr/bin/env bash

COLOR_HIGH=0xffed2985
COLOR_MID=0xff0ad2ff
COLOR_LOW=0xff3cfa50

# disk1s1 in user mode
# disk1s2 in brew service mode
VALUE=$(df -lh | grep /dev/disk1s2 | awk '{print 0+$5}' | tail -n1)
sketchybar -m --set usage.disk.value label=$VALUE%

if [ "$VALUE" -ge "75" ]; then
  sketchybar -m --set usage.disk.value label.color=$COLOR_HIGH
elif [ "$VALUE" -ge "50" ]; then
  sketchybar -m --set usage.disk.value label.color=$COLOR_MID
else
  sketchybar -m --set usage.disk.value label.color=$COLOR_LOW
fi

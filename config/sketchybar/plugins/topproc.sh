#!/usr/bin/env bash

TOPPROC=$(ps axo "%cpu,ucomm" | sort -nr | tail -n +1 | head -n1 | awk '{printf "%.0f%% %s\n", $1, $2}' | sed -e 's/com.apple.//g')
CPUP=$(echo $TOPPROC | sed -nr 's/([^\%]+).*/\1/p')

if [ $CPUP -gt 75 ]; then
  sketchybar --set $NAME label="異 $TOPPROC"
else
  sketchybar --set $NAME label=""
fi

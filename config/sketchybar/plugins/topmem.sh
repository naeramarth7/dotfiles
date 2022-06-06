#!/usr/bin/env bash

TOPMEM=$(ps axo "rss,ucomm" | sort -nr | tail -n +1 | head -n1 | awk '{printf "%.0fMB %s\n", $1 / 1024, $2}' | sed -e 's/com.apple.//g')
MEM=$(echo $TOPMEM | sed -nr 's/([^MB]+).*/\1/p')

if [ $MEM -gt 512 ]; then
  sketchybar --set $NAME icon= label="$TOPMEM"
else
  sketchybar --set $NAME label=""
fi

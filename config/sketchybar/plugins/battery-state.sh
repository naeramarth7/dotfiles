#!/usr/bin/env bash

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

sketchybar --set battery.state.label icon.color=0xff989898

if [[ ${CHARGING} != "" ]]; then
  sketchybar --set battery.state.label icon=""
  sketchybar --set battery.state.value label="${BATT_PERCENT}%"
  exit 0
fi

sketchybar -m --set battery.state.label icon.drawing=off
sketchybar -m --set battery.state.value label="${BATT_PERCENT}%"

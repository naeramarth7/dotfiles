#!/usr/bin/env zsh

source "$CONFIG_DIR/vars.sh";

CURRENT_SPACE=${NAME##*.}
FOCUSED_SPACE=$(aerospace list-workspaces --focused)

additions=()

if [ "$CURRENT_SPACE" = "$FOCUSED_SPACE" ]; then
  SELECTED="on"
  additions=(${item_active[@]})
else
  SELECTED="off"
  additions=(${item_passive[@]})
fi

sketchybar --set "$NAME" \
  background.drawing="$SELECTED" \
  "${additions[@]}"

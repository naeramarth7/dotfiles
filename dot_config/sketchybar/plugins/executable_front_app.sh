#!/usr/bin/env zsh

source "$CONFIG_DIR/vars.sh";

FOCUSED_APP_DETAILS=$(aerospace list-windows --focused)
FOCUSED_APP=$(echo $FOCUSED_APP_DETAILS | cut -d'|' -f2 | xargs)

# writes to $icon_result variable
__icon_map "${FOCUSED_APP}"

sketchybar --set "$NAME" \
  icon="$icon_result" \
  icon.font="sketchybar-app-font:Regular:12" \
  label="$FOCUSED_APP"

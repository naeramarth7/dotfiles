#!/usr/bin/env zsh

source "$CONFIG_DIR/vars.sh";

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"
COLOR=$COLOR_PASSIVE

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100)
    ICON=""
  ;;
  [6-8][0-9])
    ICON=""
    COLOR=$COLOR_OKAY
  ;;
  [3-5][0-9])
    ICON=""
    COLOR=$COLOR_WARN
  ;;
  [1-2][0-9])
    ICON=""
    COLOR=$COLOR_ERROR
  ;;
  *)
    ICON=""
    COLOR=$COLOR_ERROR
esac

if [[ "$CHARGING" != "" ]]; then
  ICON=""
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" \
  icon="$ICON" \
  label="${PERCENTAGE}%" \
  icon.color=$COLOR \
  label.color=$COLOR

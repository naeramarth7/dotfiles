#!/usr/bin/env zsh

source /etc/profiles/per-user/$(whoami)/bin/icon_map.sh

FONT="RobotoMono Nerd Font";

BACKGROUND_PLAIN="0xff0f1419"
BACKGROUND_PASSIVE="0xff1d242c"
BACKGROUND_ACTIVE="0xfff29718"

COLOR_PASSIVE="0xffffffff"
COLOR_ACTIVE="0xff000000"

BACKGROUND_HEIGHT=24

DEFAULT_PADDING=8
DOUBLE_PADDING=$((DEFAULT_PADDING * 2))
HALF_PADDING=$((DEFAULT_PADDING / 2))

defaults=(
  background.color=$BACKGROUND_PASSIVE
  background.corner_radius=0
  background.height=$BACKGROUND_HEIGHT
  background.padding_left=$HALF_PADDING
  background.padding_right=$HALF_PADDING
)

icon_only=(
  label.drawing=off
  icon.padding_left=$DEFAULT_PADDING
  icon.padding_right=$DEFAULT_PADDING
)

text_only=(
  icon.drawing=off
  label.padding_left=$DEFAULT_PADDING
  label.padding_right=$DEFAULT_PADDING
)

item_passive=(
  background.color=$BACKGROUND_PASSIVE
  icon.color=$COLOR_PASSIVE
  label.color=$COLOR_PASSIVE
)
item_active=(
  background.color=$BACKGROUND_ACTIVE
  icon.color=$COLOR_ACTIVE
  label.color=$COLOR_ACTIVE
)

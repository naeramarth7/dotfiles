#!/usr/bin/env bash

use_asdf() {
  _source_tool_versions
}

_source_tool_versions() {
  FILE="$PWD/.tool-versions"

  if [ ! -f "$FILE" ]; then
    return 0
  fi

  PLUGINS=$(cat $FILE | awk '{print $1;}')

  for plugin in $PLUGINS; do
    PATH_add $(asdf where $plugin)/bin
  done
}

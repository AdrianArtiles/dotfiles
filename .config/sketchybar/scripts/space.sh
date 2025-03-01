#!/usr/bin/env bash

source "$CONFIG_DIR/variables.sh"

UNFOCUS=$TRANSPARENT
FOCUS=$WHITE

update_space_type() {
  border_color="$RED"
  color="$WHITE"

  if [[ "$SELECTED" == 'true' ]]; then
    border_color="$FOCUS"
  else
    border_color="$UNFOCUS"
  fi

  sketchybar --set "$NAME" icon.highlight_color="$color" \
             --set "$NAME" icon.highlight="$SELECTED" \
             --set "$NAME" label.highlight_color="$color" \
             --set "$NAME" label.highlight="$SELECTED" \
             --set "$NAME" background.border_color="$border_color"
}

update_space_windows() {
  [[ "$SENDER" != 'space_windows_change' ]] && echo "> error SENDER in 'update_space_windows'" && return 0

  # NOTE: INFO is a JSON string.
  # { "space": 1, "apps": { "Linear": 1, "Chromium": 1, "iTerm": 1 } }
  space="$(echo "$INFO" | jq -r '.space')"
  apps="$(echo "$INFO" | jq -r '.apps | keys[]')"

  icon_strip=''

  if [ "${apps}" != '' ]; then
    while read -r app
    do icon_strip+=" $($CONFIG_DIR/icon_map.sh "$app")"
    done <<< "${apps}"
  fi

  sketchybar --animate sin 10 \
             --set space.$space label="$icon_strip"
}

case "$SENDER" in
  'forced'|'space_change')
    update_space_type && sketchybar --trigger space_windows_change
    ;;
  'space_windows_change')
    update_space_windows
    ;;
  *)
    ;;
esac

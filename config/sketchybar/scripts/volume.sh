#!/usr/bin/env bash

VOLUME_100=󰕾
VOLUME_66=󰕾
VOLUME_33=󰖀
VOLUME_10=󰖀
VOLUME_0=󰸈
VOLUME_ERROR=󱄡

WIDTH=75
BACKGROUND_MARGIN=8
PADDING=3

update_volume_status() {
  VOLUME_PERCENT="$INFO"
  case "$VOLUME_PERCENT" in
    [7-9][0-9]|100)
      icon="$VOLUME_100"
      ;;
    [3-6][0-9])
      icon="$VOLUME_66"
      ;;
    [1-2][0-9])
      icon="$VOLUME_33"
      ;;
    [1-9])
      icon="$VOLUME_10"
      ;;
    0)
      icon="$VOLUME_0"
      ;;
    *)
      icon="$VOLUME_ERROR"
  esac

  sketchybar --set volume icon="$icon" label="$VOLUME_PERCENT%"
}


case "$SENDER" in
  'forced')
    ;;
  'volume_change')
    update_volume_status
    ;;
  *)
    echo "> error invalid sender: $SENDER" in $0
    ;;
esac

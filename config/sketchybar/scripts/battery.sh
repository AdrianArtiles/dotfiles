#!/usr/bin/env bash

source "$CONFIG_DIR/variables.sh"

BATTERY_100=
BATTERY_75=
BATTERY_50=
BATTERY_25=
BATTERY_0=
BATTERY_CHARGING=󰂄


HEALTH=$GREEN
NORMAL=$ORANGE
DANGER=$RED
# HEALTH=$WHITE
# NORMAL=$WHITE
# DANGER=$RED


update_battery() {
  battery_info="$(pmset -g batt)"
  percentage="$(echo "$battery_info" | grep -Eo "\d+%" | cut -d% -f1)"
  charging="$(echo "$battery_info" | grep 'AC Power')"

  [[ "$percentage" = '' ]] && echo '> error getting battery info' && exit 1

  icon="$BATTERY_0"; color="$WHITE"
  case "$percentage" in
    9[0-9]|100)
      icon="$BATTERY_100"
      color="$HEALTH"
      ;;
    [6-8][0-9])
      icon="$BATTERY_75"
      color="$HEALTH"
      ;;
    [3-5][0-9])
      icon="$BATTERY_50"
      color="$NORMAL"
      ;;
    [1-2][0-9])
      icon="$BATTERY_25" 
      color="$DANGER"
      ;;
    0[0-9])
      icon="$BATTERY_0"
      color="$DANGER"
      ;;
    *)
      icon="$BATTERY_0"
      color="$WHITE"
      echo "> error invalid battery percentage: $percentage"
      ;;
  esac

  [[ "$charging" != '' ]] && icon="$BATTERY_CHARGING" && color=$WHITE

  sketchybar --set "$NAME" icon="$icon" icon.color="$color" label="$percentage%" label.color="$color"
}

case "$SENDER" in
  'forced'|'routine'|'power_source_change'|'system_woke')
    update_battery
    ;;
  *)
    echo "> error Invalid sender: `$SENDER`" in $0
    ;;
esac

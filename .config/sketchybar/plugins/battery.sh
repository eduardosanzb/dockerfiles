#!/bin/sh

source "$CONFIG_DIR/colors.sh" # Loads all defined colors
PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100) ICON=""
  ;;
  [6-8][0-9]) ICON=""
  ;;
  [3-5][0-9]) ICON=""
  ;;
  [1-2][0-9]) ICON=""
  ;;
  *) ICON=""
esac

if [[ "$CHARGING" != "" ]]; then
  ICON=""
fi

COLOR="$WHITE"
if [[ "$CHARGING" = "" ]]; then
  if [ "$PERCENTAGE" -gt 50 ]; then
    COLOR="$GREEN"
  elif [ "$PERCENTAGE" -ge 20 ] && [ "$PERCENTAGE" -le 50 ]; then
    COLOR="$YELLOW"
  elif [ "$PERCENTAGE" -lt 20 ]; then
    COLOR="$RED"
  fi
fi

sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%" icon.color="$COLOR" label.color="$COLOR"

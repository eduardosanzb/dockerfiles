#!/bin/sh

source "$CONFIG_DIR/colors.sh"

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"
  COLOR="$WHITE"


  case "$VOLUME" in
    [6-9][0-9]|100)
      ICON="󰕾"
      COLOR="$RED"
    ;;
    [3-5][0-9])
      ICON="󰖀"
      COLOR="$GREEN"
    ;;
    [1-9]|[1-2][0-9])
      ICON="󰕿"
      COLOR="$YELLOW"
    ;;
    *) ICON="󰖁" COLOR="$GREY"
  esac


  sketchybar --set "$NAME" icon="$ICON" label="$VOLUME%" icon.color="$COLOR" label.color="$COLOR"
fi

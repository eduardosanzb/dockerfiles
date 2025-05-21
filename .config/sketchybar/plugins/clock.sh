#!/bin/sh

source "$CONFIG_DIR/colors.sh"

sketchybar --set "$NAME" label="$(date '+%d/%m %a %H:%M')" label.color="$WHITE"


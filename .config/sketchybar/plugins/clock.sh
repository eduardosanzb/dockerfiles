#!/bin/sh

source "$CONFIG_DIR/colors.sh"

sketchybar --set "$NAME" label="$(date '+%d/%m %H:%M')" label.color="$WHITE"


#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

ICON_PADDING=5
ICON_ACTIVE_PADDING=15
ICON="􀤆"
case $1 in
    "1")
        ICON="1️⃣"
        ;;
    "2")
        ICON="2️⃣"
        ;;
    "b")
        ICON="🌎"
        ;;
    "c")
        ICON="📅"
        ;;
    "d") # "d" for "DB"
        ICON="💾"
        ;;
    "f") # foto
        ICON="📸"
        ;;
    "m")
        ICON="💬"
        ;;
    "n") # "n" for "notes"
        ICON="📘"
        ;;
    "t")
        ICON="🖥️"
        ;;
    "p") # foto
        ICON="🧑🏽‍💻"
        ;;
esac

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    # sketchybar --set $NAME background.drawing=on
    sketchybar --set $NAME background.drawing=on icon=$ICON icon.padding_left=$ICON_ACTIVE_PADDING icon.padding_right=$ICON_ACTIVE_PADDING

else
    # sketchybar --set $NAME background.drawing=off
    sketchybar --set "$NAME" background.drawing=off icon="$ICON" icon.padding_left="$ICON_PADDING" icon.padding_right="$ICON_PADDING"

fi

#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

sketchybar --set "$NAME" background.drawing="$SELECTED"
if [ "$SENDER" = "space_change" ]; then
  SPACE_ID=$(echo "$INFO" | jq -r '.SPACE.index')
  
  # Get all spaces info
  SPACES=$(yabai -m query --spaces)
  
  for i in {1..10}; do
    SPACE_INFO=$(echo "$SPACES" | jq ".[] | select(.index == $i)")
    HAS_WINDOWS=$(echo "$SPACE_INFO" | jq '.windows | length > 0')
    IS_FOCUSED=$(echo "$SPACE_INFO" | jq '.["has-focus"]')
    
    if [ "$HAS_WINDOWS" = "true" ] || [ "$IS_FOCUSED" = "true" ]; then
      sketchybar --set space.$i icon.drawing=on
    else
      sketchybar --set space.$i icon.drawing=off
    fi
  done
fi

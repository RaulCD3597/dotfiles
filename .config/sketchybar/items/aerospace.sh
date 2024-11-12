#!/bin/bash

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        background.color=$BG_SEC_COLR \
        background.corner_radius=10 \
        background.height=20 \
        background.drawing=off \
        label.padding_right=18 \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done

#!/bin/bash

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        background.color=0x44ffffff \
        background.corner_radius=5 \
        background.height=20 \
        background.drawing=off \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done

sketchybar --add item space_separator_left left \
           --set space_separator_left icon= \
                                 icon.font="$FONT:Bold:16.0" \
                                 background.padding_left=16 \
                                 background.padding_right=10 \
                                 label.drawing=off \
                                 icon.color=$DARK_WHITE


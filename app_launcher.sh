#!/bin/bash

# workspace_amount=$(swaymsg -t get_workspaces | jq '. | length')
#
# new_workspace_number=$((workspace_amount + 1))
#
# selected=$(ls /usr/bin |  rofi --show dmenu --prompt="Search:")
#
# if [ -n "$selected" ]; then
#   swaymsg workspace "$new_workspace_number" && swaymsg exec "$selected"
# fi
#

# Get the list of existing workspaces
workspaces=$(swaymsg -t get_workspaces | jq -r '.[].name')

# Get the current number of workspaces
workspace_amount=$(echo "$workspaces" | wc -l)

# Define the number for the new workspace
new_workspace_number=$((workspace_amount + 1))

# Combine the list of workspaces and applications
options=$(printf "%s\n%s" "$workspaces" "$(ls /usr/bin)")

# Show the menu for selection
selected=$(echo "$options" | bemenu --prompt="Search:")

# If the selected item matches an existing workspace name
if echo "$workspaces" | grep -qx "$selected"; then
    swaymsg workspace "$selected"
else
    # If it's not a workspace, create a new one and launch the application
    if [ -n "$selected" ]; then
        swaymsg workspace number "$new_workspace_number"
        swaymsg rename workspace "$new_workspace_number" to "$selected"
        swaymsg exec "$selected"
    fi
fi

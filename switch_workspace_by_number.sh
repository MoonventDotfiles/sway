#!/bin/bash

# Desired workspace number (passed as an argument)
target_workspace_number=$1

# Get the list of workspace names sorted by their position
workspace_list=$(swaymsg -t get_workspaces | jq -r 'sort_by(.num) | .[].name')

# Find the name of the workspace corresponding to the target number
target_workspace=$(echo "$workspace_list" | sed -n "${target_workspace_number}p")

# If the target workspace exists, switch to it
if [ -n "$target_workspace" ]; then
    swaymsg workspace "$target_workspace"
else
    echo "Workspace $target_workspace_number not found"
fi


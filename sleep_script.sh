#!/bin/bash
status=$(swaymsg -t get_outputs | grep '"dpms": true' | wc -l)
if [ "$status" -gt 0 ]; then
    swaymsg "output * dpms off"
else
    swaymsg "output * dpms on"
fi
# swaymsg "output * dpms off"
# status=$(swaymsg -t get_outputs | grep '"dpms": true' | wc -l)
# echo $status
# sleep 1
# echo sex
# status=$(swaymsg -t get_outputs | grep '"dpms": true' | wc -l)
# echo $status
# swaymsg "output * dpms on"

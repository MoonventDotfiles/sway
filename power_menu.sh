#!/bin/bash
swaynag -t warning -m "Power Menu" \
    -b "Shutdown" "systemctl poweroff" \
    -b "Reboot" "systemctl reboot"


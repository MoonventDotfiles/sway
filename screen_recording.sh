#!/bin/bash

if pgrep wf-recorder > /dev/null; then
    pkill -SIGINT wf-recorder
    notify-send -t 5000 "Screen recording stopped"
else
    OUTPUT_DIR="$HOME/Videos"
    FILENAME="recording_$(date +'%Y-%m-%d_%H-%M-%S').mp4"
    OUTPUT_FILE="$OUTPUT_DIR/$FILENAME"
    mkdir -p "$OUTPUT_DIR"
    wf-recorder -g "$(slurp)" -f "$OUTPUT_FILE" &
    notify-send -t 5000 "Screen recording started"
fi

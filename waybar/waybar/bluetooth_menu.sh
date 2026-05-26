#!/bin/bash

bluetoothctl devices | awk '{print $2 " " substr($0, index($0,$3))}' | while read -r line; do
    MAC=$(echo "$line" | awk '{print $1}')
    NAME=$(echo "$line" | cut -d ' ' -f 2-)
    echo "$NAME"
    echo "Connect $NAME"
    echo "echo 'connect $MAC' | bluetoothctl"
done | wofi --show dmenu | bash

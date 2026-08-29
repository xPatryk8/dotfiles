#!/bin/bash

DEVICE_PATH="/dev/input/by-id/usb-8BitDo_8BitDo_Ultimate_2C_Wireless_Controller*-event-joystick"
CHECK_INTERVAL=2

connected=false

while true; do
    if ls $DEVICE_PATH >/dev/null 2>&1; then
        if [ "$connected" = false ]; then
            steam -bigpicture &
            connected=true
        fi
    else
        if [ "$connected" = true ]; then
            connected=false
        fi
    fi
    sleep $CHECK_INTERVAL
done

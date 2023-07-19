#!/bin/bash
# changeVolume

# Arbitrary but unique message tag
msgTag="mybrightness"

brightnessctl "$@" > /dev/null

brightness="$(brightnessctl -m | sed 's/,/\n/g' | sed '4q;d')"
brightness="${brightness:0:-1}"

notify-send -a "changeBrightness" -u low -i weather-clear-symbolic -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$brightness" "Brightness: ${brightness}%"

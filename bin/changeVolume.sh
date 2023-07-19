#!/bin/bash
# changeVolume

# Arbitrary but unique message tag
msgTag="myvolume"

# Change the volume using alsa(might differ if you use pulseaudio)
#amixer -c 1 set Master "$@" > /dev/null
# Use pulse instead
if [[ "$@" == "toggle" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle > /dev/null
else
    pactl set-sink-volume @DEFAULT_SINK@ "$@" > /dev/null
fi

# Query amixer for the current volume and whether or not the speaker is muted
#volume="$(amixer -c 1 get Master | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g')"
#mute="$(amixer -c 1 get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
# Use pulse instead
volume="$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{printf $5}' | sed  's/[^0-9]*//g')"
mute="$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{printf $2}')"

if [[ $volume == 0 || "$mute" == "yes" ]]; then
    # Show the sound muted notification
    notify-send -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "Volume muted" 
else
    # Show the volume notification
    notify-send -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "Volume: ${volume}%"
fi

# Play the volume changed sound
# canberra-gtk-play -i audio-volume-change -d "changeVolume"

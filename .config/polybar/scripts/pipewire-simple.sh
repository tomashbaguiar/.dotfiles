#!/bin/sh

getDefaultSink() {
    defaultSink=$(pactl info | awk -F : '/Default Sink:/{print $2}')
    description=$(pactl list sinks | sed -n "/${defaultSink}/,/Description/s/^\s*Description: \(.*\)/\1/p")
    echo "${description}"
}

getDefaultSource() {
    defaultSource=$(pactl info | awk -F : '/Default Source:/{print $2}')
    description=$(pactl list sources | sed -n "/${defaultSource}/,/Description/s/^\s*Description: \(.*\)/\1/p")
    echo "${description}"
}

VOLUME=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
SINK=$(getDefaultSink)
SOURCE=$(getDefaultSource)

case $1 in
    "--up")
        amixer set Master 5%+
        ;;
    "--down")
        amixer set Master 5%-
        ;;
    "--mute")
        amixer set Master toggle
        ;;
    *)
        #echo "Source: ${SOURCE} | Sink: ${VOLUME} ${SINK}"
        echo "${SINK}: ${VOLUME}"
esac

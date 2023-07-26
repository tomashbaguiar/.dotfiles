#!/bin/sh

getKeyboardBattery() {
    battery=$(upower --dump | grep -i keyboard -A 7 | grep percentage | grep -o '[0-9].*')
    echo "${battery}"
}

KBDBAT=$(getKeyboardBattery)

echo "${KBDBAT}"

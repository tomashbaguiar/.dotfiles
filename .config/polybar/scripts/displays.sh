#!/bin/bash

check_monitors() {
    displays=$(xrandr | grep -w connected | cut -f 1 -d ' ')
    intern=$(xrandr | grep primary | cut -f 1 -d ' ')

    info=""

    for display in $displays; do
        state='connected'

        if [ "$display" == "$intern" ] && cat /proc/acpi/button/lid/LID0/state | grep -qo closed; then
            state='disconnected'
        fi

        info="$info $display: $state"
    done

    echo "$info"
}

INFO=$(check_monitors)

echo "$INFO"

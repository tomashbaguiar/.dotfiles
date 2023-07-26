#!/bin/bash

check_monitors() {
    displays=$(xrandr | grep -w connected | cut -f 1 -d ' ')
    intern=$(xrandr | grep primary | cut -f 1 -d ' ')

    declare -A states
    declare -A last_states
    info=""
    action="xrandr "

    for display in $displays; do
        state='connected'
        if [ "$display" == "$intern" ]; then
            if cat /proc/acpi/button/lid/LID0/state | grep -qo closed; then
                state='disconnected'
                action="$action --output $intern --off"
            else
                action="$action --output $intern --auto"
            fi
        elif cat /proc/acpi/button/lid/LID0/state | grep -qo closed; then
            action="$action --output $display --auto"
        else
            action="$action --output $display --auto --right-of $intern"
        fi

        states["$display"]=$state

        if [ "${states[$display]}" != "${last_states[$display]}" ]; then
            eval $action
        fi

        last_states["$display"]=$state

        info="${info} $display: ${states[$display]} "
    done
}

while true; do
    xrandr -q > /dev/null || exit 1
 
    check_monitors

    sleep 1
done

#!/bin/bash
kill -SIGHUP $(pgrep signal-desktop)
kill -SIGHUP $( ps -aux | grep "/usr/lib/electron/electron /usr/lib/discord/app.asar" | awk 'NR==1 {print;exit}' | sed "s/^[^0-9 ]*//g" | grep -Eo "^[^0-9]*[0-9]*\ ")
kill -SIGHUP $(pgrep telegram-desktop)
loginctl lock-session

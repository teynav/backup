#!/bin/bash
i3-msg restart
killall polybar
polybar example & disown
exit

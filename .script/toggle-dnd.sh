#!/bin/bash
a=$(gsettings get org.gnome.desktop.notifications show-banners)
if [[ $a == "true" ]];
then
	gsettings set org.gnome.desktop.notifications show-banners false
else
	gsettings set org.gnome.desktop.notifications show-banners true
fi

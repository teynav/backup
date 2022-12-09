#!/bin/bash
sudo bash -c "echo 75 > /sys/class/power_supply/BAT0/charge_control_end_threshold"
sudo bash -c "echo 77 > /sys/class/power_supply/BAT0/charge_control_end_threshold"

#!/bin/bash
echo " U:$(uptime | sed "s/.*p//g" | sed "s/,.*$//g" | sed "s/    //g")"

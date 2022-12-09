#!/bin/bash
uptime | sed "s/.*p//g" | sed "s/,.*$//g"

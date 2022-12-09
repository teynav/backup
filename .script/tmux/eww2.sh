#!/bin/bash
echo $(python -c "print($(free -m | grep Mem | awk '{print $3}')/1024)" | cut -c 1-3)"G"

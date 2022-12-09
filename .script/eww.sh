#!/bin/bash
#echo WEEEW
acpi | sed "s/^.*g,//g" | sed "s/,.*$//g"

#!/bin/bash

idle=$( top -n 1 | head -3 | tail -1 | cut -d ' ' -f 11 )
used=$( echo "scale = 2; 100 - $idle" | bc )
echo "used: $used"
echo "idle: $idle"


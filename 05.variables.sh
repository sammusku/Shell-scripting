#!/bin/bash

#===adding timestamp in sec==

START_TIME=$(date +%s)

echo "script executed at :$START_TIME"

sleep 10
END_TIME=$(date +%s)
TOTAL_TIME=$(($END_TIME-$START_TIME))
echo "script total runtime :$TOTAL_TIME"
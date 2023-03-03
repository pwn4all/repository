#!/bin/sh

# original filename : sample_$(date '+%Y-%m-%d')_$(date '+%H%M%S').txt : sample_2023-03-03_105708.txt
# renamed filename  : sample_$(date '+%Y-%m-%d').txt : sample_2023-03-03.txt

for i in $(ls sample_*.txt); do mv $i $(echo $i | awk -F '_' '{printf "%s_%s.txt",$1,$2}'); done;

#!/bin/sh

# original filename : sample_$(date '+%Y-%m-%d').txt : sample_2023-03-03.txt
# renamed filename  : sample_$(date '+%Y-%m-%d').txt.log : sample_2023-03-03.txt.log

# for i in $(ls sample_*.txt); do mv $i $(echo $i | awk -F '_' '{printf "%s_%s.txt",$1,$2}'); done;


CHAR_CHG_SCRIPT=./char_win2mac.sh

for i in $(ls sample_*.txt); do $CHAR_CHG_SCRIPT $i $(echo $i | awk -F '_' '{printf "%s_%s.txt",$1,$2}'); done;

#!/bin/bash

########################################################################################
## view locale
########################################################################################
# locale
LANG=
LC_CTYPE="POSIX"
LC_NUMERIC="POSIX"
LC_TIME="POSIX"
LC_COLLATE="POSIX"
LC_MONETARY="POSIX"
LC_MESSAGES="POSIX"
LC_PAPER="POSIX"
LC_NAME="POSIX"
LC_ADDRESS="POSIX"
LC_TELEPHONE="POSIX"
LC_MEASUREMENT="POSIX"
LC_IDENTIFICATION="POSIX"
LC_ALL=


########################################################################################
## set locale
########################################################################################
# localedef -c -i ko_KR -f UTF-8 ko_KR.UTF-8
# export LC_ALL=ko_KR.UTF-8

# cat kor.txt
한글abc1234한글



########################################################################################
## set permanently locale
########################################################################################
# cat ~/.bashrc
.
.
.
## KOR
export LC_ALL=ko_KR.UTF-8

#!bin/bash


#################################################################
## find encoding
## windows : cp949
#################################################################
$ file --mime-encoding filename.txt
./filename.txt: iso-8859-1

$ file --mime-encoding filename.log
./filename.log: utf-8


#################################################################
## change encoding
#################################################################
$ iconv -f cp949 -t utf8 source.txt > source.log
$ iconv -c -f cp949 -t utf8 source.txt > source.log



#Options controlling conversion problems:
#  -c                          discard unconvertible characters

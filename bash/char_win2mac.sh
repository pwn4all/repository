#!/bin/bash

echo "usage : iconv -f cp949 -t UTF-8 sample.txt > sample.log"

ICONV=/usr/bin/iconv

# change encoding of file content (cp949 -> utf-8)
if [ $# -ne 2 ]; then
        echo "Usage: $0 read_file write_file"
        exit -1
else
    $ICONV -f cp949 -t UTF-8 $1 > $2
fi

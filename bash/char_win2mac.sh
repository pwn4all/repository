#!/bin/bash

AWK=/usr/bin/awk
FILE=/usr/bin/file
ICONV=/usr/bin/iconv

function print_usage() {
    if [ $# -eq 0 ]; then
        echo "[+]  usage : $0 read_file.txt"
        echo "[-]command : $ICONV -c -f cp949 <file.txt> file.txt.log"
    else
        echo "[+]  usage : $0 $1"
        echo "[-]command : $ICONV -c -f cp949 <$1> $1.log"
    fi
}

# change encoding of file content (other encodings -> utf-8)
if [ $# -ne 1 ]; then
        print_usage
        exit -1
else
    $ICONV -c -f cp949 <$1> $1.log
    echo "[+] succefully created $1.log"
fi

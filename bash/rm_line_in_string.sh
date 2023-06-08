#!/bin/bash

# 파일이름 입력 확인
if [ $# -ne 1 ]; then
	echo "Usage : $0 file.txt"
fi

# 파일 이름을 할당
file=$1

# 파일을 읽고 hello 포함된 라인을 찾아 삭제해서 new_file.txt 로 저장
while read line; do
  if [[ $line =~ hello ]]; then
    continue
  fi
  echo $line
done < $file > new_file.txt

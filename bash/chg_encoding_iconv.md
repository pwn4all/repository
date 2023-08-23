## file 명령어로 인코딩 확인
```bash
#################################################################
## find encoding
## windows : cp949
#################################################################
$ file --mime-encoding filename.txt
./filename.txt: iso-8859-1

$ file --mime-encoding filename.log
./filename.log: utf-8
```

## iconv 명령어로 인코딩 변환
```bash
#################################################################
## change encoding
#################################################################
$ iconv -f cp949 -t utf8 source.txt > source.log
$ iconv -c -f cp949 -t utf8 source.txt > source.log



#Options controlling conversion problems:
#  -c                          discard unconvertible characters
```


## 특정 디렉터리 내의 .txt 등 확장자 파일을 대상으로 인코딩 변환 스크립트
```bash
#!/bin/bash

# 디렉토리 내의 모든 txt 파일을 순회하며 Encoding 변경
if [ $# -ne 4 ]; then
        echo "Usage: $0 From(UTF-8..) To(EUC-KR..) From_Ext(txt) To_Ext(euckr)"
        exit -1
fi

# 처리 대상 확장자 euckr/txt 등 수정 필요
FROM_EXT=$3
TO_EXT=$4
for txt_file in *.$FROM_EXT; do
    # 확장자를 제외한 파일명만 추출
    filename="${txt_file%.*}"

    # argv[1]인코딩을 argv[2] 인코딩으로 변경
    /usr/bin/iconv -c -f $1 -t $2 $filename.$FROM_EXT -o $filename.$TO_EXT
    echo "$filename.$FROM_EXT => $filename.$TO_EXT"
done
```

#!/bin/bash
# in CentOS 7.9 (utf-8 to euc-kr)

########################################################################################
## EUC-KR로 변경하기 위해 필요한 패키지를 설치
########################################################################################
$ sudo yum install glibc-common

########################################################################################
## setting CentOS 7.9
########################################################################################
$ sudo localedef -f EUC-KR -i ko_KR ko_KR.EUC-KR

$ sudo vi /etc/locale.conf
LANG=ko_KR.EUC-KR

$ sudo localectl set-locale LANG=ko_KR.EUC-KR

$ source /etc/locale.conf

$ vi ~/.bash_profile
# Set EUC-KR locale
export LANG=ko_KR.euckr
export LC_ALL=ko_KR.euckr

$ source ~/.bash_profile

########################################################################################
## setting vim
########################################################################################
$ vi ~/.vimrc
set fileencodings=utf-8,euc-kr
set termencoding=utf-8
set encoding=utf-8

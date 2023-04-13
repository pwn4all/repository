##########################################################################################
## restart runtime
##########################################################################################
## RAM/DISK arrow > disconnect and delete runtime
## RAM/DISK arrow > create runtime



##########################################################################################
## install mecab & konlpy
##########################################################################################
!curl -s https://raw.githubusercontent.com/teddylee777/machine-learning/master/99-Misc/01-Colab/mecab-colab.sh | bash
or
# below script
!curl -s https://raw.githubusercontent.com/pwn4all/repository/master/colab/install-mecab-script.sh | bash


##########################################################################################
## test mecab & konlpy
##########################################################################################
from konlpy.tag import Okt, Mecab

okt = Okt()
mecab = Mecab()

# 예시 문장
sentence = "안녕하세요. 문서 초기화를 위한 테스트입니다."

print(okt.nouns(sentence))
print(okt.morphs(sentence))
print(okt.pos(sentence))

print(mecab.nouns(sentence))
print(mecab.morphs(sentence))
print(mecab.pos(sentence))

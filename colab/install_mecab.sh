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
!install-mecab-colab.sh


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





## =======================================================================================
## install-mecab-colab.sh need to root permission
## ---------------------------------------------------------------------------------------
## https://bitbucket.org/eunjeon/mecab-ko-dic/src/master/
## https://bitbucket.org/eunjeon/mecab-ko/downloads/mecab-0.996-ko-0.9.2.tar.gz
## https://bitbucket.org/eunjeon/mecab-ko-dic/downloads/mecab-ko-dic-2.1.1-20180720.tar.gz
## ---------------------------------------------------------------------------------------
## https://bitbucket.org/eunjeon/mecab-python-0.996/src/master/
## =======================================================================================
#! /bin/bash
cd /tmp && \
wget "https://bitbucket.org/eunjeon/mecab-ko/downloads/mecab-0.996-ko-0.9.2.tar.gz" && \
tar zxfv mecab-0.996-ko-0.9.2.tar.gz && \
cd mecab-0.996-ko-0.9.2 && \
./configure && \
make && \
make check && \
make install && \
ldconfig

cd /tmp && \
wget "https://bitbucket.org/eunjeon/mecab-ko-dic/downloads/mecab-ko-dic-2.1.1-20180720.tar.gz" && \
apt install -y autoconf && \
tar zxfv mecab-ko-dic-2.1.1-20180720.tar.gz && \
cd mecab-ko-dic-2.1.1-20180720 && \
./autogen.sh && \
./configure && \
make && \
make install && \
ldconfig

cd /tmp && \
git clone https://bitbucket.org/eunjeon/mecab-python-0.996.git && \
cd mecab-python-0.996 && \
python setup.py build && \
python setup.py install


## ---------------------------------------------------------------------------------------
pip install konlpy
## =======================================================================================

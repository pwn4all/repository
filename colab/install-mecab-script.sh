#! /bin/bash
##########################################################################################
## reference : https://raw.githubusercontent.com/teddylee777/machine-learning/master/99-Misc/01-Colab/mecab-colab.sh
##########################################################################################
## install-mecab-script.sh need to root permission
## usage :
## curl -s https://raw.githubusercontent.com/pwn4all/repository/master/colab/install-mecab-colab.sh | bash
##########################################################################################
## https://bitbucket.org/eunjeon/mecab-ko/src/master/README.md
## https://bitbucket.org/eunjeon/mecab-ko/downloads/mecab-0.996-ko-0.9.2.tar.gz
##########################################################################################
cd /tmp && \
wget "https://bitbucket.org/eunjeon/mecab-ko/downloads/mecab-0.996-ko-0.9.2.tar.gz" && \
tar zxfv mecab-0.996-ko-0.9.2.tar.gz && \
cd mecab-0.996-ko-0.9.2 && \
./configure && \
make && \
make check && \
make install && \
ldconfig


##########################################################################################
## https://bitbucket.org/eunjeon/mecab-ko-dic/src/master/README.md
## https://bitbucket.org/eunjeon/mecab-ko-dic/downloads/mecab-ko-dic-2.1.1-20180720.tar.gz
##########################################################################################
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


##########################################################################################
## https://bitbucket.org/eunjeon/mecab-python-0.996/src/master/README.md
## https://bitbucket.org/eunjeon/mecab-python-0.996.git
##########################################################################################
cd /tmp && \
git clone https://bitbucket.org/eunjeon/mecab-python-0.996.git && \
cd mecab-python-0.996 && \
python setup.py build && \
python setup.py install


##########################################################################################
## https://konlpy.org/ko/latest/install/
##########################################################################################
pip install konlpy

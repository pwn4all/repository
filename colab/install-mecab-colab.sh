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

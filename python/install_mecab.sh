##########################################################################################
## install mecab
##########################################################################################
$ bash <(curl -s https://raw.githubusercontent.com/konlpy/konlpy/master/scripts/mecab.sh)


##########################################################################################
## run below 4 steps, if you meet below error.
##########################################################################################
>>> from konlpy.tag import Mecab
>>> mecab = Mecab()
Traceback (most recent call last):
  File "/Users/user/Library/Python/3.9/lib/python/site-packages/konlpy/tag/_mecab.py", line 77, in __init__
    self.tagger = Tagger('-d %s' % dicpath)
NameError: name 'Tagger' is not defined

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/Users/user/Library/Python/3.9/lib/python/site-packages/konlpy/tag/_mecab.py", line 82, in __init__
    raise Exception('Install MeCab in order to use it: http://konlpy.org/en/latest/install/')
Exception: Install MeCab in order to use it: http://konlpy.org/en/latest/install/
>>>


##########################################################################################
## update zsh
##########################################################################################
$ brew upgrade zsh


##########################################################################################
## install xcode
##########################################################################################
$ xcode-select --install


##########################################################################################
## install gcc
##########################################################################################
$ brew install gcc


##########################################################################################
## install mecab-python
##########################################################################################
$ pip install mecab-python

# -*- coding: utf-8 -*-

import re
from urllib.parse import unquote, quote


def is_encoded(url):
    url_after_encoding = quote(url)
    return url != url_after_encoding


def decode_url(url):
    return unquote(url)


text = "https://velog.io/@seolini43/KOBERT%EB%A1%9C-%EB%8B%A4%EC%A4%91-%EB%B6%84%EB%A5%98-%EB%AA%A8%EB%8D%B8-%EB%A7%8C%EB%93%A4%EA%B8%B0-%ED%8C%8C%EC%9D%B4%EC%8D%ACColab Hello World!!! Check out 나의 웹사이트 [https://ex.com], http://ex.co.kr, (https://naver.com/hello?id=test), {http://daum.net/2344526} 🄐Ⓒ🄴🅰㉨㊋㋕"
pattern = r'https?://[\w\-\_./?#\@!$&\'*+=%]+'
urls = re.findall(pattern, text)

decoded_urls = list()
for url in urls:
    if is_encoded(url):
        decoded_urls.append(decode_url(url))
    else:
        decoded_urls.append(url)

print(decoded_urls)

## result
# ['https://velog.io/@seolini43/KOBERT로-다중-분류-모델-만들기-파이썬Colab', 'https://ex.com', 'http://ex.co.kr', 'https://naver.com/hello?id=test', 'http://daum.net/2344526']
##

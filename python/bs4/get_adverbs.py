# -*- coding: utf-8 -*-

import requests
from bs4 import BeautifulSoup

url = 'https://namu.wiki/w/%EB%B6%84%EB%A5%98:%ED%95%9C%EA%B5%AD%EC%96%B4%20%EB%B6%80%EC%82%AC'

# 웹 페이지에서 HTML 가져오기
response = requests.get(url)
html = response.text

# BeautifulSoup을 사용하여 HTML 파싱
soup = BeautifulSoup(html, 'html.parser')

# <li> 태그 중에서 data-v-683a701b 속성이 있는 요소를 선택
li_elements = soup.select('li[data-v-683a701b]')

# 각 <li> 태그에서 title 속성 추출 및 출력
adverbs = list()
for li in li_elements:
    title = li.find('a').get('title')
    adverbs.append(title)
    # print(title)

print(adverbs)


## result
# ['감히', '갑자기', '같이', '거기', '곧', '괴발개발', '굳이', '그냥', '그닥', '그래서', '그러나', '그러니까', '그런데', '그리고', '그만', '그사이', '깡충깡충', '나름', '느릿느릿', '능히', '다', '다만', '다시', '대저', '대충', '동시', '뒤룩뒤룩', '드릉드릉', '또', '또한', '라지만', '마냥', '마치', '모처럼', '무려', '므흣', '미리', '미주알고주알', '및', '바둥바둥', '반짝반짝', '빨리빨리', '뻔뻔', '뿅뿅', '뿡', '상냥함', '설마', '쇠발개발', '심쿵', '싱글벙글', '쓰담쓰담', '아까', '아니', '아무거나', '아예', '아직', '어디', '어떠하다', '어째서', '어찌하다', '언제', '영', '오직', '왁', '왜', '요새', '요즈음', '이따', '이를테면', '이제', '있이', '자꾸', '잘', '제발', '줄곧', '진작', '징징', '짱', '쫀득', '찰랑찰랑', '퍽이나', '하냥', '하지만', '함께', '흐뭇', '흠']
##

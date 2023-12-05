# -*- coding: utf-8 -*-

# pip3 install pyahocorasick
import ahocorasick


def find_patterns(text, patterns):
    A = ahocorasick.Automaton()

    # 패턴을 Aho-Corasick 오토마타에 추가
    for idx, pattern in enumerate(patterns):
        A.add_word(pattern, (idx, pattern))

    # 패턴을 사용하여 텍스트에서 일치를 찾음
    A.make_automaton()
    matches = []
    for end_index, (pattern_index, original_pattern) in A.iter(text):
        start_index = end_index - len(original_pattern) + 1
        matches.append({
            'pattern': patterns[pattern_index],
            'start_index': start_index,
            'end_index': end_index,
        })

    return matches


# 테스트할 텍스트
texts = [
    "안녕하세요! 감사합니다.",
    "안녕히 가세요.",
    "반갑습니다.",
    "좋은 하루 되세요.",
    "안녕하세요 여러분!",
    "오늘도 감사합니다.",
    "잘 부탁드립니다.",
    "안녕히계세요.",
    "고맙습니다.",
    "좋은 날이에요."
]

# 찾을 패턴 리스트
patterns_to_find = ["안녕하세요", "감사합니다", "안녕히 가세요"]


for text in texts:
    # 패턴 찾기
    result = find_patterns(text, patterns_to_find)

    if len(result) > 0:
        # 결과 출력
        for match in result:
            # print(len(match))
            print(f"패턴: {match['pattern']}, 시작 인덱스: {match['start_index']}, 끝 인덱스: {match['end_index']}")
    else:
        print(f"키워드가 없습니다. : {text}")


## result
# 패턴: 안녕하세요, 시작 인덱스: 0, 끝 인덱스: 4
# 패턴: 감사합니다, 시작 인덱스: 7, 끝 인덱스: 11
# 패턴: 안녕히 가세요, 시작 인덱스: 0, 끝 인덱스: 6
# 키워드가 없습니다. :반갑습니다.
# 키워드가 없습니다. :좋은 하루 되세요.
# 패턴: 안녕하세요, 시작 인덱스: 0, 끝 인덱스: 4
# 패턴: 감사합니다, 시작 인덱스: 4, 끝 인덱스: 8
# 키워드가 없습니다. :잘 부탁드립니다.
# 키워드가 없습니다. :안녕히계세요.
# 키워드가 없습니다. :고맙습니다.
# 키워드가 없습니다. :좋은 날이에요.
##

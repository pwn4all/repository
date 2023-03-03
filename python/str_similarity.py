#!/usr/bin/env python3
#-*- coding: utf-8 -*-

## pip3 install cdifflib

###############################################################
## measure similarity of string
###############################################################
def measure_similarity(base_str, chk_str):
    # to remove the effect of white space
    base_str = base_str.replace(' ', '')
    print(base_str)
    # to remove the effect of white space
    chk_str = chk_str.replace(' ', '')
    print(chk_str)
    return SequenceMatcher(None, base_str, chk_str).ratio()


base_msg = 'Hello Python World.'
target_msg = 'Hello Python World.'
target_msg = 'Hello~ Python World.!'


print(measure_similarity(base_msg, target_msg))

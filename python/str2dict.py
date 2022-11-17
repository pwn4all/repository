#!/usr/bin/env python3
import json

filename = './temp.txt'
str_lines = list()
str_to_dict = dict()

with open(filename, 'r') as fd:
    str_lines = fd.readlines()
# print(str_lines)

for str_line in str_lines:
    str_to_dict = json.loads(str_line)
    print(f'format : {type(str_to_dict)}')
    print(f'dicts : {str_to_dict}')
    print(f'keys : {str_to_dict.keys()}')
    print(f'values : {str_to_dict.values()}')
    print("\n============================\n")


    
## temp.txt #############################################
## {"English": "hello world", "Spanish": "Hola Mundo", "French": "Bonjour le monde"}
## {"English": "hello python", "Spanish": "bonjour python", "French": "hola pitón"}
## temp.txt #############################################

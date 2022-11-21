#!/usr/bin/env python3
import json

filename = './temp.txt'
str_lines = list()
str_to_dict = dict()

with open(filename, 'r') as fd:
    str_lines = fd.readlines()
# print(str_lines)

line_cnt = 3
for str_line in str_lines:
    str_to_dict = json.loads(str_line)
    print("============================" * line_cnt)
    print(f'format : {type(str_to_dict)}')
    print(f'dicts : {str_to_dict}')
    print(f'keys : {str_to_dict.keys()}')
    print(f'values : {str_to_dict.values()}')
    print("============================" * line_cnt)

    
    
"""
====================================================================================
format : <class 'dict'>
dicts : {'English': 'hello world', 'Spanish': 'Hola Mundo', 'French': 'Bonjour le monde'}
keys : dict_keys(['English', 'Spanish', 'French'])
values : dict_values(['hello world', 'Hola Mundo', 'Bonjour le monde'])
====================================================================================
====================================================================================
format : <class 'dict'>
dicts : {'English': 'hello python', 'Spanish': 'bonjour python', 'French': 'hola pitón'}
keys : dict_keys(['English', 'Spanish', 'French'])
values : dict_values(['hello python', 'bonjour python', 'hola pitón'])
====================================================================================


"""

""" 
## temp.txt
{"English": "hello world", "Spanish": "Hola Mundo", "French": "Bonjour le monde"}
{"English": "hello python", "Spanish": "bonjour python", "French": "hola pitón"}
"""

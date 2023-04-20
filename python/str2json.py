
##################################################################################################################
## make file to json(dict)
##################################################################################################################
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


"""
## json string format
str_dict = '{"key": "value"}' => Good
str_dict = "{'key': 'value'}" => Error
"""



##################################################################################################################
## make string to json
## ensure_ascii=False (in case : '\ud638')
##################################################################################################################
json_str = {}
for aslist in exp.as_list():
    print("text: {}, accuracy: {}".format(aslist[0], aslist[1]))
    json_str[aslist[0]] = aslist[1]

print(json_str)
with open('result.txt', 'w', encoding='utf-8') as fd:
    fd.writelines(json.dumps(json_str, ensure_ascii=False))
    
    
    
'''
// json.dumps(json_str)
text: 호성, accuracy: 0.010036775105527087
text: 무료거부0808705900, accuracy: 0.0071254159741973265
"{\"\\ud638\\uc131\": 0.010036775105527087, \"\\ubb34\\ub8cc\\uac70\\ubd800808705900\": 0.0071254159741973265}"

// json.dumps(json_str, ensure_ascii=False)
text: 호성, accuracy: 0.010036775105527087
text: 무료거부0808705900, accuracy: 0.0071254159741973265
{'호성': 0.010062686019422755, '무료거부0808705900': 0.0071254159741973265}

'''

#!/usr/bin/env python3
import json

string_type_dict = '{"hello":"world", "key": 1234, "name":"john"}'

string_to_dict = json.loads(string_type_dict)
print(type(string_to_dict))
# print(string_to_dict['hello'])
for key in string_to_dict.keys():
    print(string_to_dict[key])

'''
------------------------------------------------
<class 'dict'>
world
1234
john
------------------------------------------------
'''

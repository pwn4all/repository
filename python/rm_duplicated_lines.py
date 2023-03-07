#!/usr/bin/env python3

#########################################################################################################
## Purpose :
## remove duplicated lines between target file and source file
#########################################################################################################
'''
1. 2 files exists
2. one(aa.txt) is target file for removing duplicated lines
3. the other(bb.txt) is source file for duplicated lines
4. put 2 files to lists(line_aa & line_bb)
5. put aa.txt to dict_aa (string is key of dic_aa for removing duplicated lines in aa.txt itself)
6. put bb.txt to dict_aa
7. remove duplicated line when key exists error eccurred
8. save unique dict_aa to new file
'''

#########################################################################################################
## import
#########################################################################################################
import pandas as pd



#########################################################################################################
## 1~3. global valiables
#########################################################################################################
home_path = '/home/user/
read_aa = 'aa.txt'
read_bb = 'bb.txt'
write_cc = 'cc.txt'


#########################################################################################################
## 4. put 2 file to each dict
#########################################################################################################
filename_read_aa = home_path+read_aa
with open(filename_read_aa, "r") as fd:
    lines_aa = fd.readlines()

filename_read_bb = home_path+read_bb
with open(filename_read_bb, "r") as fd:
    lines_bb = fd.readlines()



#########################################################################################################
## 5. put bb.txt to dict_aa
#########################################################################################################
dict_aa = {msg:idx for idx, msg in enumerate(lines_aa)}
print(len(dict_aa))


#########################################################################################################
## 6~7. put bb.txt to dict_aa
#########################################################################################################
for idx, msg in enumerate(lines_bb):
    if msg in dict_aa.keys():
        dict_aa.pop(msg)


#########################################################################################################
## 8. save unique dict_aa to new file
#########################################################################################################
filename_write_cc = home_path+write_cc
with open(filename_write_cc, 'w') as fd:
    fd.writelines(dict_aa)

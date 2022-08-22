#!/usr/bin/env python3

import os


###########################################################################################
## read_names(path_dir)
## 변경될 목적 파일명(name_new) 리스트 파일(list.txt)을 읽는다.
###########################################################################################
def read_names(path_dir):
    '''
    :param path_dir:
    :return: file_names
    '''
    # file_names = [fn.strip() for fn in os.listdir(path_dir) if not fn.startswith('.')]
    with open(path_dir+"list.txt", mode="r") as fd:
        file_names = fd.readlines()
    file_names = [fn.strip() for fn in file_names]
    return file_names


###########################################################################################
## rename_file(path_dir, name_old, name_new)
## 소스파일명(name_old)을 목적파일명(name_new)으로 변경한다.
###########################################################################################
def rename_file(path_dir, name_old, name_new):
    '''
    :param path_dir:
    :param name_old:
    :param name_new:
    :return: None
    '''
    os.rename(path_dir+name_old, path_dir+name_new)


path_dir = './directory/'
###########################################################################################
## 변경할 소스 파일(name_old)명 리스트를 읽는다.
###########################################################################################
file_lists = [fl for fl in os.listdir(path_dir) if not fl.startswith('.')]
file_lists.sort()
print(file_lists)

###########################################################################################
## 변경될 목적 파일(name_new)명 리스트를 읽는다.
###########################################################################################
file_names = read_names(path_dir)
file_names.sort()
print(file_names)

###########################################################################################
## path_dir 에 있는 파일명을 list.txt 에 있는 파일명으로 변경한다.
###########################################################################################
for idx, file_name in enumerate(file_names):
    rename_file(path_dir, file_lists[idx], file_name)
    # print(file_lists[idx], file_name)

#!/usr/bin/env python3
# coding=utf-8

import os
import argparse
import unicodedata


def get_argv():
    '''
    :check arguments
    :return: user's arguments
    '''
    parser = argparse.ArgumentParser(description='NFD to NFC')
    parser.add_argument('-p', '--path', type=str, default='./', help='-p /home/user/ (default : ./)')
    parser.add_argument('-e', '--extension', type=str, default='all', help='-e txt|xlsx|...')
    parser.add_argument('-t', '--type', type=str, default='all', help='-t all|dir|file')
    parser.add_argument('-r', '--recursive', type=str, default='off', nargs='*', help='-r [on|off]')

    return parser.parse_args()


def chk_extension(extension):
    '''
    :add dot if not startswith(dot)
    :param extension: ex)txt, .txt
    :return: .txt
    '''
    dot = '.'
    if not extension.startswith(dot):
        # print('extension : {}'.format('.'+extension))
        # print(f'extension : {dot+extension}')
        return dot+extension
    else:
        return extension


def get_filelists(path):
    '''
    :param path: String(path)
    :return: file/dir lists in path
    '''
    return os.listdir(path)


item_recursive = list()
def get_recursive(path):
    files = os.listdir(path)
    for file in files:
        item_path = os.path.join(path, file)
        # print(item_path)
        item_recursive.append(item_path)
        # recursive search in case of dir
        if os.path.isdir(item_path):
            get_recursive(item_path)
            # print(item_path)
    # print(item_lists)
    return item_recursive


def get_endswith(itemlists, format):
    '''
    :param itemlists: return lists of get_filelists()
    :param format: list(itemlists), String(format)
    :return:
    '''

    if format != None:
        lists = list()
        for itemlist in itemlists:
            if(itemlist.endswith(format)):
                lists.append(itemlist)
        return lists
    else:
        return itemlists


def chg_itemname(itemnames):
    itemlists = list()
    for itemname in itemnames:
        itemlists.append(unicodedata.normalize('NFC', itemname))
        # print(unicodedata.normalize('NFC', itemname))
    return itemlists


def chk_filetype(type, filepath, filelists):
    if type == 'all':
        # print("chk_filetype(all) : " + type)
        return filelists
    else:
        select_lists = list()
        print(filelists)
        for filelist in filelists:
            if type == 'file':
                if os.path.isfile(filepath+filelist):
                    select_lists.append(filelist)
                    # print('chk_filetype(file) : ' + filelist)
            elif type == 'dir':
                if os.path.isdir(filepath+filelist):
                    select_lists.append(filelist)
                    # print('chk_filetype(dir) : ' + filelist)
        # print(select_lists)
        return select_lists


def chk_recurtype(type, filelists):
    if type == 'all':
        # print("chk_recurtype(all) : " + type)
        return filelists
    else:
        select_lists = list()
        # print(filelists)
        for filelist in filelists:
            if type == 'file':
                if os.path.isfile(filelist):
                    select_lists.append(filelist)
                    # print('chk_recurtype(file) : ' + filelist)
            elif type == 'dir':
                if os.path.isdir(filelist):
                    select_lists.append(filelist)
                    # print('chk_recurtype(dir) : ' + filelist)
        # print(select_lists)
        return select_lists


if __name__ == '__main__':
    ########################################################################
    ## set arguments
    ########################################################################
    user_input = get_argv()

    arg_path = user_input.path
    if not arg_path.endswith('/'):
        arg_path += '/'
    arg_ext = user_input.extension
    arg_type = user_input.type
    arg_recur = user_input.recursive



    ########################################################################
    ## set arguments for test
    ########################################################################
    print("=================== Arguments ====================")
    print("[#] usage : python3 nfd2nfc.py -p /home/user -e txt type=file -r")
    print("==================================================")
    print("[+] path : {}".format(arg_path))
    print("[+] extension : {}".format(arg_ext))
    print("[+] type : {}".format(arg_type))
    print("[+] recursive : {}".format(arg_recur))
    print("==================================================")


    ########################################################################
    ## add dot(.) when doesn't have dot(.) in user_input.extension
    ## ex) doc -> .doc , txt -> .txt
    ########################################################################
    if len(arg_ext) > 0:
        user_input.extension = chk_extension(arg_ext)
    # print(f'{user_input.path} : {user_input.extension}')

    ########################################################################
    ## get lists specific dir or recursive
    ########################################################################
    if arg_recur == 'off':
        # get dir/file lists in specific path
        file_lists = get_filelists(user_input.path)
    else:
        file_lists = get_recursive(arg_path)
        # print(file_lists)
    # print(file_lists)


    ########################################################################
    ## get lists for a case of type is dir/file/all
    ########################################################################
    if arg_recur == 'off':
        item_lists = chk_filetype(arg_type, arg_path, file_lists)
    else:
        item_lists = chk_recurtype(arg_type, file_lists)
    # print(item_lists)


    ########################################################################
    ## filter extension for only file
    ########################################################################
    if arg_type == 'file':
        # get specific extension in file_lists
        nfd_lists = get_endswith(item_lists, user_input.extension)
        # print(nfd_lists)
    else:
        print("[-] ignore extension if type is dir or all")
        print("==================================================")
        nfd_lists = item_lists
    # print(nfd_lists)


    ########################################################################
    ## change dir/file name to NFD
    ########################################################################
    nfc_lists = chg_itemname(nfd_lists)
    # print(nfc_lists)


    ########################################################################
    ## save to be changed NFD format name
    ########################################################################
    for idx, nfc_list in enumerate(nfc_lists):
        nfd = os.path.join(arg_path, nfd_lists[idx])
        nfc = os.path.join(arg_path, nfc_list)
        print('[-] {0}\n  [=>] {1}'.format(nfd,nfc))

        ####################################################################
        ## uncomment when code is correctly working.
        ####################################################################
        # os.rename(nfd, nfc)



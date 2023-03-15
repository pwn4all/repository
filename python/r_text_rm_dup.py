##########################################################################################
## 단순 텍스트 파일에서 줄바꿈을 제거하고, dataframe 에 넣을 수 있는 연속된 텍스트 라인으로 변경
##########################################################################################
def read_text_file(text_file_):
    lines_ = list()
    with open(text_file_, "r") as fd:
        contents_ = fd.readlines()
    for line_ in contents_:
        lines_.append(line_.rstrip())
    return lines_


##########################################################################################
## 여러 줄의 텍스트에서 중복 라인(dups_list), 중복제거 라인(uniq_list) 추출
## ret_type_ : True(Duplicated_lines), False(Unique_lines)
##########################################################################################
def find_dup_string(lines_, dup_type_):
    dups_dict_ = dict()
    uniq_dict_ = dict()

    dups_list_ = list()
    uniq_list_ = list()

    for line_ in lines_:
        if line_ not in uniq_dict_.keys():
            uniq_dict_[line_] = 0
            # print(f"uniq : {line_}")
        else:
            dups_dict_[line_] = 1
            # print(f"dups : {line_}")

    if dup_type_:
        for key_, line_ in dups_dict_.items():
            dups_list_.append(key_)
            print(dups_list_[:4])
        return dups_list_
    else:
        for key_, line_ in uniq_dict_.items():
            uniq_list_.append(key_)
            print(uniq_list_[:4])
        return uniq_list_
  
  
  ''' usage :
contents = read_text_file(filename)
for idx, line in enumerate(contents):
    print(line)
    if idx == 4:
        break

print("=="*30)

ret_strings = find_dup_string(contents, False)
for idx, line in enumerate(ret_strings):
    print(line)
    if idx == 4:
        break
  '''

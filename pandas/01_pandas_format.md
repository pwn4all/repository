## pandas 에서 csv 와 xlsx 를 다루는 뼈대 코드 구조


* ### 패키지 선언
```python
import os
import csv
import pandas as pd
import numpy as np
from tqdm import tqdm

```


* ### 파일(csv/xlsx) 읽기
```python
##################################################################
## xlsx/csv 파일 읽기
##################################################################
def read_file(filename_):
    column_names = ['category', 'result', 'code', 'text']
    if filename_.endswith('xlsx'):
        df_ = pd.read_excel(filename_, names=column_names, \
                           header=0, sheet_name='label')#, skiprows=[0])
    elif filename_.endswith('csv')
        df_ = pd.read_csv(os.path.join(cnn_result_dir, input_xlsx), sep='\t', header=None, \
                         names=column_names, on_bad_lines='warn', lineterminator='\n', \
                         # skiprows=1, skipfooter=2, engine='python', \)
                         )

```


* ### 파일(csv/xlsx) 읽기
```python
##################################################################
## xlsx/csv 파일 읽기
##################################################################
def read_file(filename_, column_names_):
    if filename_.endswith('xlsx'):
        df_ = pd.read_excel(filename_, names=column_names, \
                           header=0, sheet_name='label')#, skiprows=[0])
    elif filename_.endswith('csv')
        df_ = pd.read_csv(os.path.join(cnn_result_dir, input_xlsx), sep='\t', header=None, \
                         names=column_names, on_bad_lines='warn', lineterminator='\n', \
                         # skiprows=1, skipfooter=2, engine='python', \)
                         )

```

* ### csv/xlsx 에서 한 셀의 구분자로 사용되는 " 이 꼬여서 여러 셀이 한 셀로 읽히거나 한 셀이 여러 셀로 분리되는 문제 제거
```python
##################################################################
## xlsx나 csv 를 읽을 때, 문장의 구분자에 영향을 주는 " 와 ' 를 제거
##################################################################
def rm_ambiguity_of_quote(df_, col_name_):
    # 문장의 처음과 마지막에 있는 공백 제거
    df_[col_name_] = df_[col_name].apply(lambda x: x.strip(' ') if x.startswith(' ') or x.endswith(' ') else x)
    # 문장의 처음에 "가 있는 경우 pandas 로 셀을 나눌 때, csv 포맷이 꼬임 방지
    df_[col_name] = df_[col_name].apply(lambda x: x.strip('"') if x.startswith('"') or x.endswith('"') else x)
    # 'text' 열에서 "가 2개 이상 연속으로 있는 경우 " 하나로 변경
    df_[col_name] = df_[col_name].str.replace(r'"+', '"', regex=True)
    df_[col_name] = df_[col_name].apply(lambda x: x.strip("'") if x.startswith("'") or x.endswith("'") else x)
    # 'text' 열에서 "가 2개 이상 연속으로 있는 경우 " 하나로 변경
    df_[col_name] = df_[col_name].str.replace(r"'+", "'", regex=True)
    # 'text' 열에서 \n 이 있는 경우 제거
    df_[col_name] = df_[col_name].str.replace(r'\n', ' ', regex=True)

    df_[~df_['text'].isnull()]

    return df_
```


* ### 파일 경로 등 전역 변수 설정
```python
##################################################################
## 전역 변수 선언
##################################################################
file_path = '/data'
input_xlsx = 'train.xlsx'
output_txt = 'train.result.xlsx'

column_names = ['category', 'result', 'code', 'text']

```



* ### 파일 읽어서 " 꼬임 제거하고 쓰기
```python
##################################################################
## 파일 읽기
##################################################################
file_input = os.path.join(file_path, input_xlsx)
df = read_file(file_input, column_names)
print(df.columns)
print(df.shape)


##################################################################
## df['text'] 컬럼에서 " 꼬임이 발생하는 경우 제거 
##################################################################
df_text = rm_ambiguity_of_quote(df, 'text')


##################################################################
## pandas 에서 처기 가능한 올바른 csv/xlsx 포맷으로 저장
##################################################################
print(df_text.shape)
print(df_text.head())
file_output = os.path.join(file_path, output_txt)
write_file(file_output, df_text)
```





# &#35; 엑셀과 CSV 는 유사하게 처리됩니다.
[pandas.read_excel manual](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.read_excel.html)
[pandas.read_csv](https://pandas.pydata.org/docs/reference/api/pandas.read_csv.html)


#### &#42; xlsx/xls/csv 파일 읽기
```python
import pandas as pd

filename = "/app/files/file.xlsx"
filename = "/app/files/file.xls"
filename = "/app/files/file.csv"

df = None

if not filename.endswith("csv"):
    column_names=['name', 'age', 'height']
    df = pd.read_excel(filename, names=column_names, header=0)
    # engine='openpyxl|python'
else:
    # Error tokenizing data. C error : lineterminator='\n'
    df = pd.read_csv(filename, names=column_names, sep='\t', header=None, \
                on_bad_lines='warn', lineterminator='\n', skiprows=1, skipfooter=2, engine='python')
```

#### &#42; 특정 셀의 데이터 타입 정의
```python
import pandas as pd

filename = "/app/files/file.xlsx"
filename = "/app/files/file.xls"
filename = "/app/files/file.csv"

if not filename.endswith("csv"):
    df = pd.read_excel(filename, engine='openpyxl', dtype={'name':str, 'age':int, 'height': float})
else:
    df = pd.read_csv(filename, sep='\t', names=['name','age','height'])
```


#### &#42; 특정 행을 제외하고 xlsx/xls/csv 읽기
```python
import pandas as pd

filename = "/app/files/file.xlsx"

if not filename.endswith("csv"):
    df = pd.read_excel(filename, engine='openpyxl', skiprows=[0])
else:
    df = pd.read_csv(filename, skiprows=0)


## excel ex)
------------------------------------------------------------------
file tile .. blah...blah...             => this row is not column name of dataframe
------------------------------------------------------------------
date | message | filename | msg_type    => column name of dataframe
------------------------------------------------------------------
11-11 | hello | file.xlsx | conversation
------------------------------------------------------------------
.
.
.
------------------------------------------------------------------
```


#### &#42; xlsx/xls/csv 로 쓰기
```python
filename = "/app/files/file.xlsx"
filename = "/app/files/file.xls"
filename = "/app/files/file.csv"

if not filename.endswith("csv"):
    with pd.ExcelWriter(filename, mode='w', engine='openpyxl') as writer:
        df_msg.to_excel(writer, index=False)
else:
    df_msg.(filename, sep='\t', index=False)
```

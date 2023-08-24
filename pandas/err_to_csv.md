# encoding error
<br>

## 1-1. error '\xa0'
```bash
.
.
Traceback (most recent call last):
.
.
  File "./save_file.py", line 55, in write_file
    df.to_csv(filename, sep=',', mode='w', index=False, encoding='euc-kr')
  File "/usr/local/lib64/python3.6/site-packages/pandas/core/generic.py", line 3170, in to_csv
    formatter.save()
  File "/usr/local/lib64/python3.6/site-packages/pandas/io/formats/csvs.py", line 206, in save
    self._save()
  File "/usr/local/lib64/python3.6/site-packages/pandas/io/formats/csvs.py", line 328, in _save
    self._save_chunk(start_i, end_i)
  File "/usr/local/lib64/python3.6/site-packages/pandas/io/formats/csvs.py", line 362, in _save_chunk
    libwriters.write_csv_rows(self.data, ix, self.nlevels, self.cols, self.writer)
  File "pandas/_libs/writers.pyx", line 66, in pandas._libs.writers.write_csv_rows
UnicodeEncodeError: 'euc_kr' codec can't encode character '\xa0' in position 136: illegal multibyte sequence
```

## 1-2. remove bad character('\xa0')
```python
##############################################################################################
## UnicodeEncodeError: 'euc_kr' codec can't encode character '\xa0' in position 136: illegal multibyte sequence
##############################################################################################
df = df.applymap(lambda x: str(x).replace('\xa0', ''))
```

<br><br>
## 2-1. error '\ufffd'
```bash
.
.
Traceback (most recent call last):
.
.
  File "./save_file.py", line 55, in write_file
    df.to_csv(filename, sep=',', mode='w', index=False, encoding='euc-kr')
  File "/usr/local/lib64/python3.6/site-packages/pandas/core/generic.py", line 3170, in to_csv
    formatter.save()
  File "/usr/local/lib64/python3.6/site-packages/pandas/io/formats/csvs.py", line 206, in save
    self._save()
  File "/usr/local/lib64/python3.6/site-packages/pandas/io/formats/csvs.py", line 328, in _save
    self._save_chunk(start_i, end_i)
  File "/usr/local/lib64/python3.6/site-packages/pandas/io/formats/csvs.py", line 362, in _save_chunk
    libwriters.write_csv_rows(self.data, ix, self.nlevels, self.cols, self.writer)
  File "pandas/_libs/writers.pyx", line 66, in pandas._libs.writers.write_csv_rows
UnicodeEncodeError: 'euc_kr' codec can't encode character '\ufffd' in position 51: illegal multibyte sequence
```

## 2-2. remove bad character('\ufffd')
```python
##############################################################################################
## UnicodeEncodeError: 'euc_kr' codec can't encode character '\ufffd' in position 51
##############################################################################################
df['text'] = df['text'].replace(r'\ufffd','', regex=True)
```

## 3. 엔터 문제 제거
```python
# 줄 바꿈 문자를 공백으로 변환(메시지를 한 줄로 변환)
df = df.str.replace('\r\n', ' ').str.replace('\n', ' ')
```


## 4. csv 처리를 위해서 자동으로 추가되지 않는 열의 앞위 " 제거
```python
##############################################################################################
## csv 파일을 읽으면 csv 인식을 위해서 하나의 컬럼을 "문자열" 과 같이 묶는데,
## 이와는 별개로 문자열 자체의 시작과 끝에 "문자열" 과 같이 있는 경우 csv 처리에 오류가 발생하므로 제거
##############################################################################################
# 메시지 제일 앞과 뒤의 " 삭제
condition = df.str.startswith('"') & df.str.endswith('"') & (df.str.len() >= 2)
df.loc[condition] = df.loc[condition].str[1:-1]
```


## 5. '^F^B' 제어문자 제거
```python
##############################################################################################
## ^F는 ASCII 코드에서 6번에 해당하는 제어 문자를 나타냅니다. 이는 "Start of Text"를 의미하며, 텍스트 통신의 시작을 나타내는 제어 문자
## ^B는 ASCII 코드에서 2번에 해당하는 제어 문자를 나타냅니다. 이는 "Start of Header"를 의미하며, 데이터 통신의 시작을 나타내는 제어 문자
##############################################################################################
# '^F^B' 제어문자 제거
df = df.str.replace("\u0002", "", regex=True)   # ^F
df = df.str.replace("\u0006", "", regex=True)   # ^B
```


## 6. '^M' 제어문자 제거
```python
## vi 로 보면 ^M 이 있지만, sed 등으로 제거가 안될 때 아래와 같이 '\r\n' 를 제거하면 됨
# 줄 바꿈 문자를 공백으로 변환(메시지를 한 줄로 변환)
df = df.str.replace('\r\n', ' ').str.replace('\n', ' ')
```


## 7. Error tokenizing data. C error 처리
```python
##############################################################################################
## pandas.errors.ParserError: Error tokenizing data. C error: Buffer overflow caught - possible malformed input file.
##############################################################################################
# lineterminator='\n' 옵션으로 에러 제거
df = pd.read_csv(os.path.join(directory, filename), names=colum_names, lineterminator='\n')
```

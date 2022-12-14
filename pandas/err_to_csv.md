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

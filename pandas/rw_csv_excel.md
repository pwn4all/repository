

# &#35; Excel processing
[pandas.read_excel manual](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.read_excel.html)
[pandas.read_csv](https://pandas.pydata.org/docs/reference/api/pandas.read_csv.html)


#### &#42; basically read xlsx/xls/csv file
```python
import pandas as pd

filename = "/app/files/file.xlsx"
filename = "/app/files/file.xls"
filename = "/app/files/file.csv"

df = None

if not filename.endswith("csv"):
    df = pd.read_excel(filename, engine='openpyxl')
else:
    df = pd.read_csv(filename)
```

#### &#42; define data type for specific cell
```python
import pandas as pd

filename = "/app/files/file.xlsx"
filename = "/app/files/file.xls"
filename = "/app/files/file.csv"

df = None

if not filename.endswith("csv"):
    df = pd.read_excel(filename, engine='openpyxl', dtype={'name':str, 'age':int, 'height': float})
else:
    df = pd.read_csv(filename, dtype={'name':str, 'age':int, 'height': float})
```

#### &#42; basically write xlsx/xls/csv file
```python
filename = "/app/files/file.xlsx"
filename = "/app/files/file.xls"
filename = "/app/files/file.csv"

if not filename.endswith("csv"):
    with pd.ExcelWriter(filename, mode='w', engine='openpyxl') as writer:
        df_msg.to_excel(writer, index=False)
else:
    with pd.ExcelWriter(filename, mode='w', engine='openpyxl') as writer:
        df_msg.to_csv(writer, index=False, sep=',')
```

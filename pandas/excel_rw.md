

# &#35; Excel processing
[read_excel() manual](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.read_excel.html)

#### &#42; basically read xlsx file
```python
import pandas as pd

filename = "/app/files/file.xlsx"
or
filename = "/app/files/file.xls"

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
or
filename = "/app/files/file.xls"

df = None

if not filename.endswith("csv"):
    df = pd.read_excel(filename, engine='openpyxl', dtype={'name':str, 'age':int, 'height': float})
else:
    df = pd.read_csv(filename, dtype={'name':str, 'age':int, 'height': float})
```

# &#35; select data using condition
[pandas.DataFrame.loc manual](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.loc.html)

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

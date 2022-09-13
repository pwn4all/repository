# &#35; remove duplicate data
[pandas.DataFrame.drop_duplicate manual](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.drop_duplicates.html)

#### &#42; frac option
```python
import pandas as pd


df.drop_duplicates('col_name', keep='first')

or

df.drop_duplicates(subset=['col_name'], keep='first')

```

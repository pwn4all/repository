# &#35; set dataframe
[pandas.DataFrame.astype manual](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.astype.html)

#### &#42; basically set dataframe
```python
import pandas as pd

df = pd.DataFrame({
    'max_speed': [1, 4, 7],
    'shield': [2, 5, 8]
})

------------------
df
------------------

	max_speed	shield
0	1		2
1	4		5
2	7		8


```

#### &#42; set dataframe using options
```python
------------------------------------------------------
df['max_speed'] = df['max_speed'].astype('int32')
df['shield'] = df['shield'].astype('int32')
df.info()
------------------------------------------------------
<class 'pandas.core.frame.DataFrame'>
RangeIndex: 3 entries, 0 to 2
Data columns (total 2 columns):
 #   Column     Non-Null Count  Dtype
---  ------     --------------  -----
 0   max_speed  3 non-null      int32
 1   shield     3 non-null      int32
dtypes: int32(2)
memory usage: 152.0 bytes



------------------
df
------------------

	max_speed	shield
0	1		2
1	4		5
2	7		8

```



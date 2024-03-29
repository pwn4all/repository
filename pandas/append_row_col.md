# &#35; set dataframe
[pandas.DataFrame.append manual](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.append.html)

#### &#42; basically set dataframe
```python
import pandas as pd
df = pd.DataFrame([[1, 2], [3, 4]], columns=list('AB'), index=['x', 'y'])
------------------
df
------------------
   A  B
x  1  2
y  3  4
```

#### &#42; set another dataframe and append to df
```python
import pandas as pd
df2 = pd.DataFrame([[5, 6], [7, 8]], columns=list('AB'), index=['x', 'y'])
df = pd.concat([df, df2])
------------------
df
------------------
   A  B
x  1  2
y  3  4
x  5  6
y  7  8
```


#### &#42; set another dataframe and append to df
```python
import pandas as pd
df3 = pd.DataFrame([[5, 6], [7, 8]], columns=list('CD'), index=['x', 'y'])
df = pd.concat([df, df3], axis=1)
------------------
df
------------------
	A	B	C	D
x	1	2	5	6
y	3	4	7	8

```

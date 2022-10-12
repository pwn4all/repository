# &#35; append dataframe
[pandas.DataFrame manual](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.sample.html)

#### &#42; set dataframe
```python
import pandas as pd
df = pd.DataFrame([[1, 2], [3, 4]], columns=list('AB'), index=['x', 'y'])
df
#----------------------------------------
	A	B
x	1	2
y	3	4
#----------------------------------------
df2 = pd.DataFrame([[5, 6], [7, 8]], columns=list('AB'), index=['w', 'z'])
df2
#----------------------------------------
A	B
w	5	6
z	7	8
#----------------------------------------
```

#### &#42; merge using append
```python
df_merge = df.append(df2)
df_merge
#----------------------------------------
	A	B
x	1	2
y	3	4
w	5	6
z	7	8
#----------------------------------------
```

#### &#42; merge using concat
```python
df_merge = pd.concat([df, df2])
df_merge
#----------------------------------------
	A	B
x	1	2
y	3	4
w	5	6
z	7	8
#----------------------------------------
```


#### &#42; save to file
```python
filename = 'merge_file.xlsx'
if not filename.endswith("csv"):
    with pd.ExcelWriter(filename, mode='w', engine='openpyxl') as writer:
        df_merge.to_excel(writer, index=False)
else:
    with pd.ExcelWriter(filename, mode='w', engine='openpyxl') as writer:
        df_merge..to_csv(writer, index=False, sep=',')

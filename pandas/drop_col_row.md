# &#35; drop column or row
[pandas.DataFrame.drop manual](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.drop.html)

#### &#42; basically set dataframe
```python
import pandas as pd
df = pd.DataFrame(np.arange(12).reshape(3, 4),
                  columns=['A', 'B', 'C', 'D'])
------------------------------------
df
------------------------------------

	A	B	C	D
0	0	1	2	3
1	4	5	6	7
2	8	9	10	11
```

#### &#42; drop row
```python
import pandas as pd

df = pd.DataFrame(np.arange(12).reshape(3, 4),
                  columns=['A', 'B', 'C', 'D'])
------------------------------------
# not save
df.drop(index=[0,2], axis=0)
------------------------------------

	A	B	C	D
1	4	5	6	7

# save
df = df.drop(index=0, axis=0)

------------------------------------
df
------------------------------------
	A	B	C	D
1	4	5	6	7
2	8	9	10	11
```

#### &#42; drop column
```python
import pandas as pd

df = pd.DataFrame(np.arange(12).reshape(3, 4),
                  columns=['A', 'B', 'C', 'D'])

------------------------------------
# not save
df.drop(columns=['B','C'], axis=1)
------------------------------------

	A	D
0	0	3
1	4	7
2	8	11

# save
df = df.drop(columns='B', axis=1)

------------------------------------
df
------------------------------------

	A	C	D
0	0	2	3
1	4	6	7
2	8	10	11
```

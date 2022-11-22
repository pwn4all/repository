# &#35; remove duplicate data
[pandas.DataFrame.drop_duplicate manual](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.drop_duplicates.html)

#### &#42; set dataframe
```python
import pandas as pd

df = pd.DataFrame(data={'A': [1,2,2,4], 'B': [5,5,7,8], 'C': [2,4,6,6]})

------------------------------------
df
------------------------------------
	A	B	C
0	1	5	2
1	2	5	4
2	2	7	6
3	4	8	6
```


#### &#42; drop_duplicates
```python
import pandas as pd

df = pd.DataFrame(data={'A': [1,2,2,4], 'B': [5,5,7,8], 'C': [2,4,6,6]})

------------------------------------
# not save
df.drop_duplicates('A', keep='first')
------------------------------------

	A	B	C
0	1	5	2
1	2	5	4
3	4	8	6
```

# &#35; rename column/row name and value
[pandas.DataFrame.rename manual](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.rename.html)

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


#### &#42; rename columns
```python
import pandas as pd

df = pd.DataFrame(data={'A': [1,2,2,4], 'B': [5,5,7,8], 'C': [2,4,6,6]})

------------------------------------
# not save
df.rename(columns={"A": "AA", "B": "BB"})
------------------------------------


	AA	BB	C
0	1	5	2
1	2	5	4
2	2	7	6
3	4	8	6
```


#### &#42; rename rows(index)
```python
import pandas as pd

df = pd.DataFrame(data={'A': [1,2,2,4], 'B': [5,5,7,8], 'C': [2,4,6,6]})

------------------------------------
# not save
df.rename(index={0: 10, 1: 11})
------------------------------------

	A	B	C
10	1	5	2
11	2	5	4
2	2	7	6
3	4	8	6
```



#### &#42; rename data(value)
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

------------------------------------
df['A'] = df['A'].replace([1,2,4],[11,22,44])
------------------------------------
	A	B	C
0	11	5	2
1	22	5	4
2	22	7	6
3	44	8	6
```

# ▫️ find or drop null
[pandas.DataFrame.isnull manual](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.isnull.html)
***
<br>

## <blockquote>set dataframe
```python
import pandas as pd
import numpy as np

df = pd.DataFrame([
{'name': 'Mahatma Gandhi', 'country': 'india', 'age': 20},
{'name': 'Christopher Columbus', 'country': 'spain', 'age': 39},
{'name': 'King Arthur', 'country': 'united kingdom', 'age': 20},
{'name': 'John Adams', 'country': np.nan, 'age': 21}
])

------------------------------
df
------------------------------
	name	                country	            age
0	Mahatma Gandhi	        india	            20
1	Christopher Columbus	spain	            39
2	King Arthur	        united kingdom      20
3	John Adams	        NaN                 21

```
<br><br>

## <blockquote>find null value
```python

--------------------------
df['country'].isnull()
--------------------------
0    False
1    False
2    False
3     True
Name: country, dtype: bool


--------------------------
df[df['country'].isnull()]
or
df[~df['country'].notnull()]
--------------------------
	name	country	age
3	John Adams	NaN	21
```
<br><br>


## <blockquote>find not null value
```python

--------------------------
df['country'].notnull()
--------------------------
0     True
1     True
2     True
3    False
Name: country, dtype: bool


--------------------------
df[df['country'].notnull()]
or
df[~df['country'].isnull()]
--------------------------
	name	country	age
0	Mahatma Gandhi	india	20
1	Christopher Columbus	spain	39
2	King Arthur	united kingdom	20
```
<br><br>
	

## <blockquote>drop rows that contain null
```python
--------------------------
df = df['country'].dropna(axis=0)
df
--------------------------
                name        country        age
0        Mahatma Gandhi           india   20
1  Christopher Columbus           spain   39
2           King Arthur  united kingdom   20


```

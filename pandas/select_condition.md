# &#35; select and update data using condition
[pandas.DataFrame.loc manual](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.loc.html)

#### &#42; set dataframe
```python
import pandas as pd

df = pd.DataFrame([
{'name': 'Mahatma Gandhi', 'country': 'india', 'age': 20},
{'name': 'Christopher Columbus', 'country': 'spain', 'age': 39},
{'name': 'King Arthur', 'country': 'united kingdom', 'age': 20},
{'name': 'John Adams', 'country': 'usa', 'age': 21}
])

------------------------------
df
------------------------------
	name	                country	            age
0	Mahatma Gandhi	        india	            20
1	Christopher Columbus	spain	            39
2	King Arthur	        united kingdom      20
3	John Adams	        usa                 21

```


#### &#42; select data using single condition
```python

cond_1=(df['age']==39)
df.loc[cond_1]

--------------------------
name	country	age
1	Christopher Columbus	spain	39


```


#### &#42; select data using multi condition
```python

cond_1=(df['age']==20)
cond_2=(df['name'].str.contains('Arthur'))
df.loc[cond_1&cond_2]

--------------------------
name	country	age
2	King Arthur	united kingdom	20

```


#### &#42; update data using multi condition
```python

cond_1=(df['age']==20)
cond_2=(df['name'].str.contains('Arthur'))
df.loc[cond_1&cond_2, 'age'] = 100

--------------------------
df
--------------------------
	name	country	age
0	Mahatma Gandhi	india	20
1	Christopher Columbus	spain	39
2	King Arthur	united kingdom	100
3	John Adams	usa	21


```



#### &#42; except string
```python

--------------------------
# not save
df[~df['name'].str.contains('Arthur')]
# save
df = df[~df['name'].str.contains('Arthur')]
df
--------------------------
	name	country	age
0	Mahatma Gandhi	india	20
1	Christopher Columbus	spain	39
3	John Adams	usa	21


```

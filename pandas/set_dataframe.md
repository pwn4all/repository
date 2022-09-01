# &#35; set dataframe
[pandas.DataFrame manual](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.html)

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
  0     1         2
  1     4         5
  2     7         8


```

#### &#42; set dataframe using options
```python
import pandas as pd

df = pd.DataFrame([[1, 2], [4, 5], [7, 8]],
     index=['cobra', 'viper', 'sidewinder'],
     columns=['max_speed', 'shield'])

------------------
df
------------------
            max_speed	shield
cobra	        1         2
viper	        4         5
sidewinder	7         8

```

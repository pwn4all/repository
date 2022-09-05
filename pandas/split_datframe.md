# &#35; set dataframe
[pandas.DataFrame manual](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.sample.html)

#### &#42; frac option
```python
import pandas as pd

# train_data(70%), test_data(30%)
train_data = df.sample(frac=0.7, random_state=2022)
test_data = df.drop(train_data.index)

```



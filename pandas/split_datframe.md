# &#35; set dataframe
[pandas.DataFrame manual](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.sample.html)

#### &#42; frac option
```python
import pandas as pd

# train_data(70%), test_data(30%)
train_data = df.sample(frac=0.7, random_state=2022)
test_data = df.drop(train_data.index)

```

#### &#42; save to file
```python
filename = 'train.xlsx'
#filename = 'test.xlsx'

if not filename.endswith("csv"):
    with pd.ExcelWriter(filename, mode='w', engine='openpyxl') as writer:
        train_data.to_excel(writer, index=False)
        #test_data.to_excel(writer, index=False)
else:
    with pd.ExcelWriter(filename, mode='w', engine='openpyxl') as writer:
        train_data..to_csv(writer, index=False, sep=',')
        #test_data.to_csv(writer, index=False, sep=',')
```

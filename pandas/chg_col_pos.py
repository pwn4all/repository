#########################################################################################################
## 1. change position for specific colunm name
#########################################################################################################
df['date'] = '2022-03-18 10:00:00'
df.insert(0, 'date', df.pop('date'))
df['date'] = pd.to_datetime(df['date'])

print(df.dtypes)
'''
date    datetime64[ns]
message              object
result                int64
dtype: object
'''

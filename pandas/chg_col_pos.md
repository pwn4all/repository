## 1. 특정 컬럼명으로 데이터 추가/삭제

```python
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
```

## 2. 특정 컬럼명에 조건으로 데이터 변경

```python
# 'code' 값이 'H/S'로 시작하는 행의 'result' 값을 'Hat/Space'로 채우기
df.loc[df['code'].str.startswith('H'), 'result'] = 'Hat'
df.loc[df['code'].str.startswith('S'), 'result'] = 'Space'
```

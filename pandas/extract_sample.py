#########################################################################################################
## 1. init
#########################################################################################################
import pandas as pd

data = {
  "number": [100, 200, 300, 400, 500],
  "message": ['hello world', 'hello python', 'hello java', 'hello flutter', 'hello perl']
}

#########################################################################################################
## 2. load dataframe
#########################################################################################################
df = pd.DataFrame(data)

#########################################################################################################
## 3. extract desired rows using number
#########################################################################################################
print("[+] extract 3 rows ======================================")
print(df.sample(n=3))


#########################################################################################################
## 4. extract desired rows using percent
#########################################################################################################
print("[+] extract 50 percent ==================================")
print(df.sample(frac=0.5))
print("[+] apply random_state ==================================")
print(df.sample(frac=1, random_state=1000))
print("[+] apply reset_index() =================================")
print(df.sample(frac=1, random_state=1000, ignore_index=True).reset_index())
print("[+] apply reset_index(drop=True) =================================")
print(df.sample(frac=1, random_state=1000, ignore_index=False).reset_index(drop=True))



''' result
[+] extract 3 rows ======================================
   number        message
4     500     hello perl
3     400  hello flutter
1     200   hello python
[+] extract 50 percent ==================================
   number     message
4     500  hello perl
2     300  hello java
[+] apply random_state ==================================
   number        message
2     300     hello java
1     200   hello python
0     100    hello world
4     500     hello perl
3     400  hello flutter
[+] apply reset_index() =================================
   index  number        message
0      0     300     hello java
1      1     200   hello python
2      2     100    hello world
3      3     500     hello perl
4      4     400  hello flutter
[+] apply reset_index(drop=True) =================================
   number        message
0     300     hello java
1     200   hello python
2     100    hello world
3     500     hello perl
4     400  hello flutter
'''

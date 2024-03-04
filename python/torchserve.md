## torchserve 패키지
```bash
https://github.com/pytorch/serve/tree/master/examples/Huggingface_Transformers
```


## 환경
```bash
sudo yum update
sudo yum install java-11-openjdk-devel    # 가급적 최신 버전(1.8 안됨)
sudo alternatives --config java

pip install optimum torchserve torch-model-archiver
```

## 파일
```bash
config.json  # bert 모델 저장시에 생성
Transformer_handler_generalized.py  # https://github.com/pytorch/serve/blob/master/examples/Huggingface_Transformers/Transformer_handler_generalized.py
```


## 순서 
### 1) 모델 및 Inference 코드 준비
```bash
예를 들어, bert_inference.py 와 bert_model.pt 파일을 준비
```

### 2) 모델 아카이브(bert_model.mar) 생성
```bash
torch-model-archiver --model-name bert_model --version 1.0 --model-file bert_inference.py --serialized-file bert_model.pt --handler Transformer_handler_generalized.py --extra-files "config.json"

```

### 3) 서버 시작
```bash
torchserve --start --ncs --model-store model_store --models bert_model.mar
.
.
Inference address: http://127.0.0.1:8080
Management address: http://127.0.0.1:8081
Metrics address: http://127.0.0.1:8082
.
.
```

### 4) 추론(Inference) 요청
```bash
## 테스트 문장 1개
curl http://localhost:8080/predictions/bert_model -T 'input.txt'

```

```python
## 문장 여러 개
import pandas as pd

# 엑셀 파일 경로
excel_file = 'data.xlsx'

# 엑셀 파일에서 데이터 읽기
df = pd.read_excel(excel_file)

# 첫 번째 열의 데이터를 추론 데이터로 사용
texts = df[df.columns[0]].tolist()


import requests

# `torchserve` 추론 API 주소
url = 'http://localhost:8080/predictions/bert_model'

# 응답을 저장할 리스트
responses = []

for text in texts:
    # 텍스트 데이터를 'data' 인자에 넣어서 POST 요청
    response = requests.post(url, data=text)
    
    # 응답 받기
    if response.status_code == 200:
        # 성공적인 응답 처리
        print("추론 결과:", response.text)
        responses.append(response.text)
    else:
        # 오류 처리
        print("추론 요청 실패:", response.status_code)

```


### 5) 서버 종료
```bash
## 테스트 문장 1개
torchserve --stop

```

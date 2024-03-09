#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from flask import Flask, send_file

app = Flask(__name__)


@app.route('/img/<filename>')
def download_file(filename):
    # 파일이 저장된 경로를 지정해주세요.
    file_path = f'{filename}'

    # Flask의 send_file 함수를 사용하여 파일을 다운로드합니다.
    return send_file(file_path, as_attachment=True)

if __name__ == '__main__':
    # app.run(host='0.0.0.0', debug=True, port=8448)
    app.run(ssl_context=('forbidden.config/cert.pem', 'forbidden.config/key.pem'), host='0.0.0.0', debug=True, port=8448)


##################################################################
## how to generate cert.pem and key.pem
##################################################################
# openssl req -x509 -newkey rsa:4096 -nodes -out cert.pem -keyout key.pem -days 3650







##################################################################
## below is client code
##################################################################
import requests

# Flask 서버의 주소 및 포트
base_url = "http://localhost:8448/img/"

# 다운로드 받고 싶은 파일 이름
filename = "example.jpg"

# 파일을 다운로드 받을 URL
url = base_url + filename

# 서버에 GET 요청을 보내 파일을 다운로드 받음
response = requests.get(url)

# 응답이 성공적인지 확인
if response.status_code == 200:
    # 받은 데이터로 파일을 저장
    with open(filename, 'wb') as f:
        f.write(response.content)
    print(f"File '{filename}' has been downloaded successfully.")
else:
    print(f"Failed to download the file. Status code: {response.status_code}")



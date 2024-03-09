#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from flask import Flask, request, jsonify
from werkzeug.utils import secure_filename
import os

app = Flask(__name__)

# 파일이 저장될 경로 설정
UPLOAD_FOLDER = 'uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# 폴더가 존재하지 않으면 생성
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

@app.route('/img/<filename>', methods=['POST'])
def save_file(filename):
    # 요청에서 파일을 가져옴
    file = request.files['file']

    if file:
        # 파일 이름을 안전하게 만듦
        filename = secure_filename(filename)

        # 파일을 저장할 경로 설정
        save_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)

        # 파일 저장
        file.save(save_path)

        return jsonify(message=f"File '{filename}' uploaded successfully."), 200
    else:
        return jsonify(message="No file provided."), 400


if __name__ == '__main__':
    #app.run(host='0.0.0.0', debug=True, port=8448)
    app.run(ssl_context=('cert.pem', 'key.pem'), host='0.0.0.0', debug=True, port=8448)


##################################################################
## how to generate cert.pem and key.pem
##################################################################
# openssl req -x509 -newkey rsa:4096 -nodes -out cert.pem -keyout key.pem -days 3650







##################################################################
## below is client code
##################################################################
import requests

# 서버의 URL (HTTPS를 사용)
url = "https://yourserver.com/img/your_file.xlsx"

# 업로드할 파일
files = {'file': open('your_file.xlsx', 'rb')}

# SSL 인증서 검증을 건너뛰고 파일 업로드를 위한 POST 요청
# 보안상의 이유로 실제 운영 환경에서는 verify 인자를 생략하거나 적절한 CA 번들을 지정하는 것이 좋습니다.
#response = requests.post(url, files=files, verify=False)
response = requests.post(url, files=files, verify=False)

# 응답 출력
print(response.text)



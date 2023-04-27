#!/bin/bash

# 환경 설정
BASE_PATH="$HOME/Virtualenv/flaskapi"
source "$BASE_PATH/bin/activate"

# 로그 파일 경로
LOG_FILE="$BASE_PATH/flask_svc.log"

# 현재 일시와 함께 로그를 작성
echo "$(date) - Starting Flask ========================" >> "$LOG_FILE"

# Flask 서버 실행
nohup python3 "$BASE_PATH/flask_svc.py" >> "$LOG_FILE" 2>&1 &

# 종료 메시지 작성
#echo "$(date) - Flask server started" >> "$LOG_FILE"

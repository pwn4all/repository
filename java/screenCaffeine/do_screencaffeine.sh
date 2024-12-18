#!/bin/bash
JAVA_BIN="/opt/homebrew/opt/openjdk@21/bin"
JAR_FILE="$HOME/utils/ScreenCaffeine.jar"
LOG_FILE="$HOME/utils/ScreenCaffeine.log"

NOHUP="/usr/bin/nohup"

# 로그 파일에 nohup 출력 및 에러를 모두 저장
$NOHUP $JAVA_BIN/java -jar "$JAR_FILE" >> "$LOG_FILE" 2>&1 &

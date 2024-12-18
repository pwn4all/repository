#!/bin/sh

# JAVA_BIN 경로 설정
JAVA_BIN="/opt/homebrew/opt/openjdk@21/bin"

# 사용법 출력 함수
usage() {
    echo "Usage: $0 <JavaFileNameWithoutExtension>"
    echo "Example: $0 ScreenCaffeine"
    exit 1
}

# 인자 확인
if [ "$#" -ne 1 ]; then
    usage
fi

# 전달받은 파일명
FILE_NAME=$1

# 파일명 체크: Java 소스 파일이 존재하는지 확인
if [ ! -f "${FILE_NAME}.java" ]; then
    echo "Error: ${FILE_NAME}.java does not exist."
    exit 1
fi

# 컴파일
echo "Compiling ${FILE_NAME}.java..."
${JAVA_BIN}/javac "${FILE_NAME}.java"
if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

# MANIFEST.MF 파일 존재 확인
if [ ! -f "MANIFEST.MF" ]; then
    echo "Error: MANIFEST.MF file not found in the current directory."
    exit 1
fi

# JAR 파일 생성
echo "Creating ${FILE_NAME}.jar..."
${JAVA_BIN}/jar cfm "${FILE_NAME}.jar" MANIFEST.MF "${FILE_NAME}.class"
if [ $? -ne 0 ]; then
    echo "JAR creation failed."
    exit 1
fi

# JAR 실행
echo "Running ${FILE_NAME}.jar..."
${JAVA_BIN}/java -jar "${FILE_NAME}.jar"
if [ $? -ne 0 ]; then
    echo "Execution failed."
    exit 1
fi

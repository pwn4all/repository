#!/bin/bash
JAVA_BIN="/opt/homebrew/opt/openjdk@21/bin"
JAR_FILE="$HOME/utils/ScreenCaffeine.jar"
LOG_FILE="$HOME/utils/ScreenCaffeine.log"

NOHUP="/usr/bin/nohup"

# run jar
$NOHUP $JAVA_BIN/java -jar "$JAR_FILE" &
#$NOHUP $JAVA_BIN/java -jar "$JAR_FILE" >> "$LOG_FILE" 2>&1 &

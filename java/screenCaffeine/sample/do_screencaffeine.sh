#!/bin/bash
JAVA_BIN="/opt/homebrew/opt/openjdk@21/bin"
JAR_FILE="$HOME/utils/ScreenCaffeine.jar"
LOG_FILE="$HOME/utils/ScreenCaffeine.log"

NOHUP="/usr/bin/nohup"

# run jar
$NOHUP $JAVA_BIN/java -jar "$JAR_FILE" &
#$NOHUP $JAVA_BIN/java -jar "$JAR_FILE" >> "$LOG_FILE" 2>&1 &

: <<'EOF'
# run using launchctl
1. launchctl load $HOME/Library/LaunchAgents/com.user.screencaffeine.plist
2. launchctl unload $HOME/Library/LaunchAgents/com.user.screencaffeine.plist
3. launchctl list | grep -i screencaffeine
EOF

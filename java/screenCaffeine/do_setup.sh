#!/bin/sh

: <<'EOF'
# required file list
1. ScreenCaffeinePlist.class > com.user.screencaffeine.plist
2. ScreenCaffeine.jar
EOF

# Error Handler
check_error() {
    if [ $? -ne 0 ]; then
        echo "$1 failed."
        exit 1
    fi
}

# Check if a file exists
check_file_exists() {
    if [ ! -f "$1" ]; then
        echo "Error: $1 does not exist."
        exit 1
    fi
}


SCREENCAFFEINE_PLIST=com.user.screencaffeine.plist
FILE_NAME=ScreenCaffeine

# create screenCaffeine.conf
echo -e "LOGFILENAME=ScreenCaffeine\nLOGFILEPATH=utils\n " > ${FILE_NAME}.conf

# create utils directory if it does not exist
echo "Creating $HOME/utils directory if it does not exist..."
/bin/mkdir -p "$HOME/utils"
check_error "Failed to create $HOME/utils directory."


# copy config file to utils dir
echo "Copying ${FILE_NAME}.conf..."
check_file_exists ${FILE_NAME}.conf
/bin/cp ${FILE_NAME}.conf $HOME/utils
check_error "copy ${FILE_NAME}.conf."


# copy jar file to utils dir
echo "Copying ${FILE_NAME}.jar..."
# check_file_exists ${FILE_NAME}.jar
/bin/cp ${FILE_NAME}.jar $HOME/utils
check_error "copy ${FILE_NAME}.jar"

# create com.user.screencaffeine.plist
java ScreenCaffeinePlist

# copy config file to utils dir
# echo "Copying ${SCREENCAFFEINE_PLIST}..."
# check_file_exists ${SCREENCAFFEINE_PLIST}
# /bin/cp com.user.screencaffeine.plist $HOME/Library/LaunchAgents/com.user.screencaffeine.plist
# check_error "copy ${SCREENCAFFEINE_PLIST}"
/bin/chmod 644 $HOME/Library/LaunchAgents/${SCREENCAFFEINE_PLIST}
/bin/launchctl load $HOME/Library/LaunchAgents/${SCREENCAFFEINE_PLIST}
/bin/launchctl list | grep com.user.screencaffeine


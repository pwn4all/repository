#!/bin/sh

# JAVA_BIN Path
JAVA_BIN="/opt/homebrew/opt/openjdk@21/bin"

# Print usage
usage() {
    echo "Usage: $0 <JavaFileNameWithoutExtension>"
    echo "Example: $0 ScreenCaffeine"
    exit 1
}

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

# Check if a argument exists
if [ "$#" -ne 1 ]; then
    usage
fi

# Get filename
FILE_NAME=$1

# copy config file to utils dir
echo "Copying ${FILE_NAME}.conf..."
check_file_exists ${FILE_NAME}.conf
/bin/cp ${FILE_NAME}.conf $HOME/utils
check_error "copy ${FILE_NAME}.conf failed."

# Check if a Java file exists
check_file_exists "${FILE_NAME}.java"

# Compiling
echo "Compiling ${FILE_NAME}.java..."
${JAVA_BIN}/javac "${FILE_NAME}.java"
check_error "Compilation failed."

# Check if MANIFEST.MF file exists
check_file_exists "MANIFEST.MF"

# create jar file
echo "Creating ${FILE_NAME}.jar..."
${JAVA_BIN}/jar cfm "${FILE_NAME}.jar" MANIFEST.MF "${FILE_NAME}.class"
check_error "JAR creation failed."

# copy jar file to utils dir
echo "Copying ${FILE_NAME}.jar..."
# check_file_exists ${FILE_NAME}.jar
/bin/cp ${FILE_NAME}.jar $HOME/utils
check_error "copy ${FILE_NAME}.jar failed."

# execute jar file
echo "Running ${FILE_NAME}.jar..."
${JAVA_BIN}/java -jar "${FILE_NAME}.jar"
check_error "Execution failed."


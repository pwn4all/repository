#!/bin/sh

: <<'EOF'
# required file list
1. ScreenCaffeine.java
2. ScreenCaffeinePlist.java
3. MANIFEST.MF
EOF

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

# create utils directory if it does not exist
echo "Creating $HOME/utils directory if it does not exist..."
mkdir -p "$HOME/utils/test"
check_error "Failed to create $HOME/utils directory."

# Check if a Java file exists
check_file_exists "${FILE_NAME}.java"

# Compiling ScreenCaffeine
echo "Compiling ${FILE_NAME}.java..."
javac "${FILE_NAME}.java"
check_error "Compilation failed."

# Compiling PLIST_NAME
echo "Compiling ${FILE_NAME}Plist.java..."
javac "${FILE_NAME}Plist.java"
check_error "Compilation failed."

# Check if MANIFEST.MF file exists
check_file_exists "MANIFEST.MF"

# create jar file
echo "Creating ${FILE_NAME}.jar..."
jar cfm "${FILE_NAME}.jar" MANIFEST.MF "${FILE_NAME}.class"
check_error "JAR creation failed."


# execute jar file
#echo "Running ${FILE_NAME}.jar..."
# java -jar "${FILE_NAME}.jar"
#check_error "Execution failed."


#!/bin/sh

/bin/cp com.user.screencaffeine.plist $HOME/Library/LaunchAgents/com.user.screencaffeine.plist
/bin/chmod 644 $HOME/Library/LaunchAgents/com.user.screencaffeine.plist
/bin/launchctl load $HOME/Library/LaunchAgents/com.user.screencaffeine.plist
/bin/launchctl list | grep com.user.screencaffeine

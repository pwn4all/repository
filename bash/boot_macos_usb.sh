#!/bin/zsh

########################################################################################
## format first
########################################################################################
# Format USBName to MacOS(Extended Journaled)
diskutil eraseDisk JHFS+ USBName /dev/disk5s1

# Format USBName to MacOS(Extended)
diskutil eraseDisk HFS+ USBName /dev/disk5s1

# Format USBName to MS-DOS fat32 for windows
diskutil eraseDisk FAT32 USBName /dev/disk5s1

# Format USBName to ExFAT for windows ans macos
diskutil eraseDisk ExFAT USBName /dev/disk5s1


########################################################################################
## make bootable macos usb second
########################################################################################
sudo /Applications/Install\ macOS\ Ventura.app/Contents/Resources/createinstallmedia --volume /Volumes/USB_32G

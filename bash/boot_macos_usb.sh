#!/bin/zsh

########################################################################################
## format first
########################################################################################
# find disk name
########################################################################################
$ diskutil list
/dev/disk0 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *500.3 GB   disk0
   1:             Apple_APFS_ISC Container disk2         524.3 MB   disk0s1
   2:                 Apple_APFS Container disk3         494.4 GB   disk0s2
   3:        Apple_APFS_Recovery Container disk1         5.4 GB     disk0s3
.
.
/dev/disk2 (external, pyysical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      FDisk_partition_scheme                        *15.8 GB   disk2
   1:             Apple_HFS VENTURA                      *15.8 GB   disk2

########################################################################################
# Format USBName to MacOS(Extended Journaled)
diskutil eraseDisk JHFS+ USBName disk2

# Format USBName to MacOS(Extended)
diskutil eraseDisk HFS+ USBName disk2

# Format USBName to MS-DOS fat32 for windows
diskutil eraseDisk FAT32 USBName disk2

# Format USBName to ExFAT for windows ans macos
diskutil eraseDisk ExFAT USBName disk2


########################################################################################
## make bootable macos usb second
########################################################################################
sudo /Applications/Install\ macOS\ Ventura.app/Contents/Resources/createinstallmedia --volume /Volumes/USB_32G

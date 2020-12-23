#!/system/bin/sh

# Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.

# Default status
STATUS=invalid

# Read the e-Fuse once
ewriter 0 0 1 > /dev/null 2>&1

if [ $? -eq 0 ]; then
	log -t efuse Reading e-Fuse succeeded
	STATUS=$(ewriter 0 0 1 | sed '2!d')
else
	log -t efuse Reading e-Fuse failed
fi

# Log the value in logcat buffer
log -t efuse Initial e-Fuse value: $STATUS
# ...and property
setprop efuse.status $STATUS

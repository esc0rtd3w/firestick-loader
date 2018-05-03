#!/bin/bash

# Original Source: http://pastebin.com/810UgmRN

# - Matches on source and compiled code
# - Searches in user home directories by default
# - Detects certain strings in files smaller 300 kbyte
# - Does not print anything if nothing was found
# - Appends the file's time stamp of the files in question > good indicator to spot false positives
# - Should work on most Linux systems with bash

# Old version
#for f in $(find /home/ -type f -size -300 2> /dev/null); do
#	if [[ $(strings -a "$f" 2> /dev/null | egrep "/proc/(self|%d)/(mem|maps)") != "" ]];then
#		m=$(stat -c %y $f); echo "Contains DirtyCOW string: $f MOD_DATE: $m";else
#		echo "DOES NOT Contain DirtyCOW";
#fi;
#done;

for f in $(find /home/ -type f -size -300 2> /dev/null); do
	if [[ $(egrep "/proc/(self|%d)/(mem|maps)" "$f") != "" ]];then
		m=$(stat -c %y "$f"); echo "Contains DirtyCOW string: $f MOD_DATE: $m";else
		echo "DOES NOT Contain DirtyCOW";
fi;
done;

read
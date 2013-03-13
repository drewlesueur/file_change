#!/bin/bash

# file to watch = $1
# command to do is $2
old_info=`stat $1`
while true; do
	new_info=`stat $1`
	if [ "$old_info" == "$new_info" ]; then
		echo "same"	
	else
		echo "different"
		$2
		old_info=`stat $1`
	fi
	sleep 2
done

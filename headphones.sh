#!/bin/bash

# aliased to 'headphones'

# the output to check for after the command has been run
SUCCESS="Connection successful"

COUNT=0
MAX_ATTEMPTS=20

while [ $COUNT -lt $MAX_ATTEMPTS ]; do
	COUNT=$((COUNT+1))
	echo "Attempt $COUNT"
	
	# attempt to connect
	OUTPUT=$(bluetoothctl connect 88:D0:39:37:5E:FC)

	# check if the success string exists in the output and break
	if [[ $OUTPUT == *$SUCCESS* ]]; then
		echo $SUCCESS
		break
	fi

	sleep 1
done


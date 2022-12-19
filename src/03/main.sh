#!/bin/bash

echo "Please choose a method to delete the created files:"
echo "1 - Delete the files using the log file"
echo "2 - By creation date and time"
echo "3 - By name mask"

read method

if [ -z $method ]
then
	echo "You should choose a method of deletion. Please try again"
fi

if ! [[ $method =~ [1-3] ]]
then 
	echo "There are only three valid methods"
fi

case $method in
	1)
		bash clean_space_log.sh
		;;
	2)
		bash clean_space_date_and_time.sh
		;;
	3)
		bash clean_space_mask.sh
esac

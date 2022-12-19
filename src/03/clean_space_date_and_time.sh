#!/bin/bash/

echo "You should enter the timeframe in which the script is going to delete files and folders"
echo "Both start and end date should be entered"
echo "Example:"
echo "30 nov 2022 05:00"

echo "Enter the start date:"
read start

if [ -z "$start" ]
then
	echo "Date cannot be empty. Please try again"
	exit 1
fi

echo "Enter the end date:"
read end

if [ -z "$end" ]
then
	echo "Date cannot be empty. Please try again"
	exit 1
fi

#find ../02/test/ -type f -newermt "$start:00" -not -newermt "$end"
#find ../02/test/ -type f -newermt "$start:00" -not -newermt "$end:00" -delete &> /dev/null
find /home/ -type f -newermt "$start:00" -not -newermt "$end:00" -delete &> /dev/null
#find ../02/test/ -type d -newermt "$start:00" -not -newermt "$end"
#find ../02/test/ -type d -newermt "$start:00" -not -newermt "$end:00" -delete &> /dev/null
find /home/ -type d -newermt "$start:00" -not -newermt "$end:00" -delete &> /dev/null


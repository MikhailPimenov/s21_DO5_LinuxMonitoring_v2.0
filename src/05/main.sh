#!/bin/bash

. ./sort_by_response_code
. ./get_unique_ips
. ./get_errors
. ./get_ips_with_errors

regex="../04/[0-9]{2}-[0-9]{2}-[0-9]{4}.log"

# 1. All entries sorted by response code
# 2. All unique IPs found in the entries
# 3. All requests with errors (resonse code - 4xx or 5xx)
# 4. All unique IPs found among the erroneous requests

choice=$1

case $choice in

	1)
		name_of_dir="sorted_by_response_code"
		echo "The sorted data is going to be created in the \"$name_of_dir\" directory"
		mkdir $name_of_dir

		for dir in ../04/logs/*; do
			if [[ $dir =~ $regex ]]; then
			sort_by_response_code $dir $name_of_dir
		fi
		done

	;;

	2)
		name_of_dir="lists_of_unique_ips"
		echo "The lists with the unique IPs are going to get created in the \"$name_of_dir\" directory"
		mkdir $name_of_dir

		for dir in ../04/logs/*; do
			if [[ $dir =~ $regex ]]; then
			get_unique_ips $dir $name_of_dir
		fi
		done

	;;

	3)

		name_of_dir="reqests_with_errors"
		echo "The with errors are going to get created in the \"$name_of_dir\" directory"
		mkdir $name_of_dir

		for dir in ../04/logs/*; do
			if [[ $dir =~ $regex ]]; then
			get_errors $dir $name_of_dir
		fi
		done

	;;
	
	4)

		name_of_dir="ips_of_reqests_with_errors"
		echo "The with errors are going to get created in the \"$name_of_dir\" directory"
		mkdir $name_of_dir

		for dir in ../04/logs/*; do
			if [[ $dir =~ $regex ]]; then
			get_ips_with_errors $dir $name_of_dir
		fi
		done

	;;

	*)
		echo "The only allowed input parameters are:"
		echo "1 - All entries sorted by response code"
		echo "2 - All unique IPs found in the entries"
		echo "3 - All requests with errors - 4xx, 5xx"
		echo "4 - All unique IPs found among the erroneous requests"
		echo "Please try again"
	;;

esac	

#!/bin/bash

file=../02/log_file.log
#folder_path=$(grep Folder $file | cut -d ' ' -f 3)
#echo $folder_path
#find ../02/test/ -path "$folder_path"
#find ../02/test/ -wholename "$folder_path"

folder_path="$(cat $file | awk -F ' ' '{print $3}')"
regex='^\/'
for folder in $folder_path
do
	if [[ $folder =~ $regex ]]
	then
		#folder_without_backslash=${folder::-1}
		#find ../02/test/ -path "$folder_without_backslash"
		#find ../02/test/ -wholename "$folder_without_backslash"
		#echo "$folder hello"
		$sudo rm -r $folder &> /dev/null
	fi
done

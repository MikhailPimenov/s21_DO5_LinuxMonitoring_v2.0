#!/bin/bash

# find test -maxdepth 1 -mindepth 1 -type d -printf '%f\n'

#for dir in $(find test -maxdepth 100 -mindepth 1 -type d); do
#	if ! [[ $dir =~ \N*bin\N* ]]; then
#		echo $dir;
#	fi
#done

#random_int=$(( $RANDOM % 50 + 1 ))

#echo $random_int

#for dir in $(find test -maxdepth 100 -mindepth 1 -type d -name '*271122*'); do
#	echo $dir
#done

#num_files=3
#created_files=0
#file_size=12
#path=test
#extension="exe"
#dirs=$(find $path -type d -name '*271122*')
#for dir in $dirs; do
#	echo "Before if $num_files"
#	if [[ $created_files -le $num_files ]]; then
#		file_name=""
#		for (( index=0; index<counter_to_repeat; ++index )); do
#			file_name+="a"
#		done
#		((++counter_to_repeat))
#		file_name+="_"
#		file_name+=$(date +"%d%m%y")
#		fallocate -l $file_size"MB" $dir/$file_name"."$extension
#		((++created_files))
#	else
#		echo "In else before $num_files"
#		created_files=0
#		echo "In else after $num_files"
#	fi
#done


full=$(basename -- "$1")
without_kb="${full%k*}"
echo "full - $full"
echo "without kb - $without_kb"


#!/bin/bash

num_files=5

for (( index = 0; index < num_files; ++index )); do
	
	. ./generate_file.sh

done

directory_for_logs="logs"
mkdir $directory_for_logs
mv *.log $directory_for_logs
echo "The logs are in the \"$directory_for_logs\" directory"

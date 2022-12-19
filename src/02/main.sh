#!/bin/bash/

. ./check_input
. ./check_empty_space
. ./create_folders
. ./create_files

start_time_to_display=`date +%T`
echo "Start time of the script: $start_time_to_display" >> log_file.log
start_time_to_count=`date +%s`

check_input $@


free_space=$(check_empty_space)
path=/home/
#path=test
folder_names=$1
file_names=$2
file_size=$3

create_folders $path $folder_names
create_files $path $file_names $file_size

if ! [[ $free_space == "Enough free space" ]]; then
	echo "There isn't enough free space left"
	echo "Should be over 1GB left to run the script"
fi

end_time_to_display=`date +%T`
echo "End time of the script: $end_time_to_display" >> log_file.log
end_time_to_count=`date +%s`
runtime=$((end_time_to_count-start_time_to_count))
echo "Run time of the script: $runtime seconds" >> log_file.log

echo "Start time = $start_time_to_display"
echo "End time = $end_time_to_display"
echo "Runtime = $runtime seconds"

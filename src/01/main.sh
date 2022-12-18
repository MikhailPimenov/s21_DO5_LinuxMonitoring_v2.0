#!bin/bash

path=$1
number_of_subfolders=$2
folder_letters=$3
files_per_folder=$4
file_letters=$5
file_size=$6


echo 'path '$path
echo 'number_of_subfolders '$number_of_subfolders
echo 'folder_letters '$folder_letters
echo 'files_per_folder '$files_per_folder
echo 'file_letters '$file_letters
echo 'file_size '$file_size


letters=$(echo "abcdefgh" | fold -w1)
echo $letters
string=$(shuf -e abcdefg)
echo $string
#!/bin/bash

current_date=$(date +"%d%m%y")
#find ../02/test -path "*$current_date*" -delete
find /home/ -path "*$current_date*" -delete
#find ../02/test -name "*$current_date*" -delete
find /home/ -name "*$current_date*" -delete

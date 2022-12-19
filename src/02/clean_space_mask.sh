#!/bin/bash

current_date=$(date +"%d%m%y")
find ~ -path "*$current_date*" -delete
find ~ -name "*$current_date*" -delete

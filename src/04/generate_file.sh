#!/bin/bash

. ./generate_date_and_time
. ./generate_ip
. ./generate_method
. ./generate_username
. ./generate_response_code
. ./generate_bytes
. ./generate_user_agent

log_name="$day-$month-$year.log"
touch $log_name

max_repetitions=1000
min_repetitions=100
diff_repetitions=$max_repetitions-$min_repetitions
number_of_lines=$(( $RANDOM % $diff_repetitions + $min_repetitions ))
if [[ $number_of_lines -lt $min_repetitions ]]; then
	number_of_lines=100
fi

for (( repetitions = 0; repetitions <= $number_of_lines; ++repetitions )); do
	hour_s=$(insert_zero $hour)
	if [[ $hour_s == "$max_hour" ]]; then
		hour_s="00"
	fi
	minute_s=$(insert_zero $minute)
	second_s=$(insert_zero $second)
	utc_offset=$(date +%z)

	ip=$(generate_ip)
	method=$(generate_method)
	username=$(generate_username)
	response_code=$(generate_response_code)
	bytes_sent=$(generate_bytes)
	# HTTP referer is the name of an optional HTTP header field that identifies the address of the web page, from which the resource has been requested
	http_referer="-"
	user_agent=$(generate_user_agent)
	echo "$ip - $username - [$day/$month_s/$year:$hour_s:$minute_s:$second_s $utc_offset] \"$method\" $response_code $bytes_sent \"$http_referer\" \"$user_agent\"" >> $log_name
	max_step_for_the_clock=60
	second=$(( $RANDOM % $max_step_for_the_clock + 1 + $second ))
	if [[ $second -gt $max_second ]]; then
		second=0
		((++minute))
	fi
	if [[ $minute -gt $max_minute ]]; then
		minute=0
		((++hour))
	fi
	if [[ $hour -eq $max_hour ]]; then
		break;
	fi
done

echo "Total num of lines: $number_of_lines"

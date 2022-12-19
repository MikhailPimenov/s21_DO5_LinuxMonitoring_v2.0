#!/bin/bash

function scrape_cpu {
	echo "# HELP cpu_used_in_percent The total CPU used as percent value" >> /var/www/html/metrics/index.html
# Output to the 09 folder for testing
#	echo "# HELP cpu_used_in_percent The total CPU used as percent value" >> metrics.html
	echo "# TYPE cpu_used_in_percent gauge" >> /var/www/html/metrics/index.html
#	echo "# TYPE cpu_used_in_percent gauge" >> metrics.html
	echo "cpu_used_in_percent $(ps -eo pcpu | awk '{s+=$1} END {print s}')" >> /var/www/html/metrics/index.html
#	echo "cpu_used_in_percent $(ps -eo pcpu | awk '{s+=$1} END {print s}')" >> metrics.html
}

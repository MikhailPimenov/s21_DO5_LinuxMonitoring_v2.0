#!/bin/bash

# Should be run by a cron from the root of the user. The metrics file is created there too

. ./scrape_cpu.sh
. ./scrape_free_hd_space.sh
. ./scrape_free_mem.sh

#. ./school21/DO4_LinuxMonitoring_v2.0-0/src/09/scrape_cpu.sh
#. ./school21/DO4_LinuxMonitoring_v2.0-0/src/09/scrape_free_hd_space.sh
#. ./school21/DO4_LinuxMonitoring_v2.0-0/src/09/scrape_free_mem.sh

if [ $# != 0 ]; then
	echo "Script takes no arguments"
	exit 1
else

	while true; do
		if [[ -f "/var/www/html/metrics/index.html" ]]; then
			rm /var/www/html/metrics/index.html
		fi
		scrape_cpu
		scrape_free_hd_space
		scrape_free_mem
		sleep 5;
	done
fi

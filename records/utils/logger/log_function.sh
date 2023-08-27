#! /bin/bash

# when sourcing must provide the log file name  which is the filename.csv_log"
log_file_name=$1

log_function () {
if [[ "$#" -ne 2 ]]; then
	echo "Wrong number of arguments. Cannot use log function">&2
else
	my_date=$(date +"%d/%-m/%Y %H:%M:%S")
	echo "$my_date $1 $2" >> $log_file_name
fi

}

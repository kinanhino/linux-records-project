#! /bin/bash

filename=$1
log_file=$2
. records/utils/input_validation_help/check_input_validity.sh $filename
. records/records_functions/search/search_by_name.sh $filename
. records/records_functions/insert_function/insert_main.sh
. records/utils/logger/log_function.sh $log_file
insert_record () {
	echo "Enter the record name and it's number of copies you want to insert"
	echo "must be provided as follow: recordName, number_of_copies"
	read user_input

	check_user_input "$user_input"
	flag=$?
	while [[ "$flag" -ne 0 ]]; do
		echo "please enter a valid input"
		read user_input
		check_user_input "$user_input"
		flag=$?
	done
	local record_name=$(echo "$user_input" | awk -F', ' '{print $1}')
	local num_of_copies=$(echo "$user_input" | awk -F', ' '{print $2}')
	local result=$(search_by_name $record_name)
	local next_result=$(select_or_show $result)
	insert_main $record_name $num_of_copies $next_result $filename
	if [[ $? -eq 0 ]]; then
		echo "record inserted successfully"
	else
		echo "something went wrong while inserting the record">&2
	fi
	echo "rec: $record_name, cop: $num_of_copies"
	
	
}

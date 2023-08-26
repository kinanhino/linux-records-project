#! /bin/bash
filename=$1
log_file=$2
. records/utils/input_validation_help/check_input_validity.sh $filename
. records/records_functions/delete_function/delete_main.sh $filename $log_file

delete_record() {
    echo "Enter the record name and the number of copies you want to delete"
	echo "must be provided as follow: recordName, number_of_copies_to_delete"
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
	local num_to_delete=$(echo "$user_input" | awk -F', ' '{print $2}')
    delete_main $record_name $num_to_delete
}

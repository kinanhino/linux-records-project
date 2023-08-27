#!/bin/bash

filename=$1
log_file=$2

. records/records_functions/update_name/update_name_main.sh $filename $log_file
. records/utils/logger/log_function.sh $log_file
. records/records_functions/search/search_main.sh $filename $log_file
. records/utils/input_validation_help/check_record_name_validity.sh

update_record_name() {
    read -p "Enter current record name: " old_name
    local result=$(search_main "$old_name")
    # Check if the record was found
    if [[ $? -ne 0 ]]; then
        echo "Record not found."
        return 1
    fi
    old_name=$(echo $result | awk -F', ' '{print $1}')
    read -p "Enter new name for the record: " new_name
    check_record_name_validity "$new_name"
    flag=$?
    while [[ $flag -ne 0 ]]; do
	    read -p "Please enter new valid name for the record: " new_name
	    check_record_name_validity "$new_name"
	    flag=$?
    done 
    update_name_main "$old_name" "$new_name"
}




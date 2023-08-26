#!/bin/bash

filename=$1
log_file=$2


. records/records_functions/update_quantity/update_quantity_main.sh $filename $log_file


. records/records_functions/search/search_main.sh $filename $log_file

update_record_quantity() {
    read -p "Enter record name to update: " record_name
    local result=$(search_main "$record_name")

    # Check if the record was found
    if [[ $? -ne 0 ]]; then
        echo "Record not found."
        log_function "Update Quantity" "Failure: Record not found"
        return 1
    fi
	
    update_record_quantity $result
    return 0
}

	


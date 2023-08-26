#! /bin/bash
filename=$1
log_file=$2

. records/utils/logger/log_function.sh $log_file

delete_main() {
    local record_name=$1
    local num_to_delete=$2

    # Search for the record
    local result=$(search_main $record_name)
    local current_copies=$(echo "$result" | awk -F', ' '{print $2}')

    # Check if record is found
    if [[ -z $current_copies ]]; then
        echo "Record not found."
        log_function "Delete" "Fail: Record not found"
        return 1
    fi

    # Check if the number to delete is valid
    if (( num_to_delete <= 0 )); then
        echo "Invalid number of copies to delete."
        log_function "Delete" "Fail: Invalid number"
        return 1
    fi

    # Update the record
    if (( num_to_delete >= current_copies )); then
        sed -i "/$record_name/d" $filename
        echo "Record deleted."
    else
        local new_copies=$(( current_copies - num_to_delete ))
        sed -i "s/$record_name, $current_copies/$record_name, $new_copies/" $filename
        echo "Record updated. New number of copies: $new_copies"
    fi

    log_function "Delete" "Success"
    return 0
}




#!/bin/bash

filename=$1
log_file=$2

. records/utils/logger/log_function.sh $log_file
. records/utils/input_validation_help/check_number_of_copies_validity.sh 
update_quantity_main () {

# Extract current quantity
    local current_copies=$(echo "$result" | awk -F', ' '{print $2}')

    # Prompt for new quantity or amount to add/subtract
    read -p "Current quantity is $current_copies. Enter new quantity: " new_copies
    check_number_of_copies_validity $new_copies
    flag=$?
    while [[ $flag -ne 0 ]]; do
    	read -p "please enter a positive integer for the new quantity: " new_copies
    	flag=$?
    done
    # Update the record
    sed -i "s/$record_name, $current_copies/$record_name, $new_copies/" $filename

    # Log the update
    log_function "Update Quantity" "Success"
    echo "Quantity updated successfully."
}

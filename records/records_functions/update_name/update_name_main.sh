#!/bin/bash

filename=$1
log_file=$2

. records/utils/logger/log_function.sh $log_file

update_name_main() {
    local old_name=$1
    local new_name=$2

    # Update the record name
    sed -i "s/^$old_name,/$new_name,/" $filename

    # Log the update
    log_function "Update Name" "Success"
    echo "Record name updated successfully."
}


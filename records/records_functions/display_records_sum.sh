#! /bin/bash

# This function displays the total number of copies from all records
display_records_sum() {
    local total_copies=0
    while IFS=',' read -r record_name num_of_copies; do
        total_copies=$(( total_copies + num_of_copies ))
    done < "records/$filename"
    echo "Total number of copies from all records: $total_copies"
}

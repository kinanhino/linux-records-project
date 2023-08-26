#! /bin/bash

############# Displays records sorted alphabetically by record name ###############
display_sorted_records () {
    echo "Displaying records sorted alphabetically by record name:"
    sort -t',' -k1 "records/$filename" | while read line; do
        echo $line
    done
}

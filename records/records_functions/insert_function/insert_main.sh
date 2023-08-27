#! /bin/bash

filename=$1
log_file=$2
. records/utils/logger/log_function.sh $log_file
insert_main () {

record_name=$1
num_of_copies=$2
#echo "filename: $filename"
flag=$(grep "$record_name" "$filename" | wc -l)
if [[ $flag -eq 0 ]]; then
	echo "$record_name, $num_of_copies" >> $filename
else
	current_copies=$(grep "$record_name" "$filename" | awk -F', ' '{print $2}')
	new_copies=$(( current_copies+num_of_copies ))
	sed -i "s/$recordname, $current_copies/$recordname, $new_copies/" $filename
fi
log_function "Insert" "Success"
}

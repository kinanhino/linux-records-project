#! /bin/bash

#when sourcing must provide 1 positional argument which is the records_file

#source the script of any_recordname_found.sh to use it's function
source records/utils/record_list_helper/any_recordname_found.sh

if [[ "$#" -ne 1 ]]; then
	echo "Wrong usage of just_show script, must provide 1 external argument which is the filename" >&2
	return 1
fi

filename=$1
just_show () {
	record_name_pattern=$1
	local result=$(grep "$record_name_pattern" "records/$filename")
	any_record_found $result
	local flag=$?
	if [[ $flag -eq 0 ]]; then
		IFS=$'\n'
		for line in $result; do
			echo $line
		done
		
	else
		echo "no results found" >&2
	fi
}

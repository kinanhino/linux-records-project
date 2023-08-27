#! /bin/bash

filename=$1
log_file=$2

. records/records_functions/search/search_main.sh $filename

search_by_name () {
	read -p "Enter search term: " term
	#IFS=$'\n'
	#local result=$(search_main $term)
	local flag=$(grep -i "$term" $filename | wc -l)

    if [[ $flag -ne 0 ]]; then
    	#IFS=$'\n'
    	local result=$(grep -i "$term" $filename)
    	#echo $result
    	IFS=$'\n'
    	echo "$result"
#	done
    	log_function "Search" "Success"
    	return 0
    else
    	#echo "search was not found on $term">&2
    	log_function "Search" "Failure: term not found"
    	return 1
    fi


}


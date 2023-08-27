#! bin/bash
filename=$1
log_file=$2
. records/utils/logger/log_function.sh $log_file
search_main () {
    term=$1
    
    local flag=$(grep -i "$term" $filename | wc -l)

    if [[ $flag -ne 0 ]]; then
    	IFS=$'\n'
    	local result=$(grep -i "$term" $filename)
    	#echo $result
    	if [[ $flag -ne 1 ]]; then
	    	select line in $result; do
			echo $line
			break
		done
	else 
		echo $result
	fi
	
    	log_function "Search" "Success"
    	return 0
    else
    	#echo "search was not found on $term">&2
    	log_function "Search" "Failure: term not found"
    	return 1
    fi
}

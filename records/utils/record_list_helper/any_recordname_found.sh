#! /bin/bash

#when sourcing must have 1 positional argument which is the recordName

any_record_found () {
	local result=$1

	if [[ -z $result ]]; then
		echo "no results matching your record_name found on the records file">&2
		return 1
	else
		return 0
		#found something which means the file includes some records with that specific name
	fi
}

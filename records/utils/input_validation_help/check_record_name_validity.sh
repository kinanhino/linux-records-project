#! /bin/bash

#when sourcing the file doesn't need any external arguments

re_record_name='^[a-zA-Z0-9 ]+$'

check_record_name_validity () {

	if [[ "$#" -ne "1" ]]; then
		echo "Wrong usage of check_rec_name_validity, must provide 1 external argument">&2
		return 1
	else
		record_name=$1
		if [[ "$record_name" =~ $re_record_name ]]; then
			#echo $record_name
			return 0
		else
			#echo "the record name is not valid, please try again">&2
			return 1
		fi

	fi
}
check_record_name_validity "$record_name"
flag=$?
if [[ $flag -eq 0 ]];
coninsdas good
else
echo "bad record name"

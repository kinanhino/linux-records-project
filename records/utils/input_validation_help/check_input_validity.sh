#! /bin/bash

#when sourcing the file doesn't need any external arguments

#source the checkCopiesNumber and the checkRecordName in order to use them
#they are at the same level of this script file
source records/utils/input_validation_help/check_number_of_copies_validity.sh
source records/utils/input_validation_help/check_record_name_validity.sh
#now we can use each function inside each of those files

re_user_input='[ a-zA-Z0-9]+, [0-9]+'


#this function is usefull for insert/delete/update_quantity
#the function must have 1 argument when it's called
#input should be as follows: "recordName, Copies"
check_user_input () {
	if [[ "$#" -ne 1 ]]; then
		echo "Wrong usage of check_user_input">&2
		return 1
	else
		user_input=$1
		#echo "$user_input"
		if [[ "$user_input" =~ $re_user_input ]]; then
			record_name=$(echo "$user_input" | awk -F', ' '{print $1}')
			num_of_copies=$(echo "$user_input" | awk -F', ' '{print $2}')
			#echo "records: $record_name"
			check_record_name_validity "$record_name"
			flag1=$?
			if [[ $flag1 -ne 0 ]]; then
				echo "the record name is not valid, please try again">&2
				return 1
			fi
			
			#echo "copies: $num_of_copies"
			check_number_of_copies_validity $num_of_copies
			flag2=$?
			if [[ $flag2 -ne 0 ]]; then
				echo "the number of copies is not valid, please try again">&2
				return 1
			fi
		else
			echo
			echo "Wrong input, must be as follows: 'recordName, Copies'">&2
			echo "recordName must include characters,numbers and spaces only">&2
			echo "Copies must be a positive number">&2
			echo
			return 1	
		fi
	fi
	#echo "$record_name,$num_of_copies"
	return 0

}

#	check_user_input "recordName, 123"
#	echo
#	check_user_input "asd123DD, 123"
#	echo
#	check_user_input "asd 123DD, 123"
#	echo
#	check_user_input "asd, 123d"
#	echo
#	check_user_input "123---cks+=, 123"
#	echo
#	check_user_input "good asSd, -89"


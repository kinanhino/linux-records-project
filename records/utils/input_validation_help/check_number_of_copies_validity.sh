#! /bin/bash

#when sourcing the file doesn't need any external arguments

re_copies_number='^[1-9][0-9]*$'

check_number_of_copies_validity () {

	if [[ "$#" -ne "1" ]]; then
		echo "Wrong usage of check_number_of_copies_validity, must provide 1 external argument">&2
		echo 1
		return
	else
		num_of_copies=$1
		if [[ "$num_of_copies" =~ $re_copies_number ]]; then
			#echo $num_of_copies
			return 0
		else
			#echo "the number of copies is not valid, please try again">&2
			return 1
		fi
	fi
}

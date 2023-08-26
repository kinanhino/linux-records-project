#! /bin/bash

#source echo_menu_function.sh in order to use the menu_function inside it
. records/utils/record_list_helper/echo_menu_function.sh

#source clean_exit.sh in order to use the clean_exit function inside it
. records/records_functions/exit_function/clean_exit.sh

filename=$1
filename_for_functions= $(pwd | grep -o '.*records/')
#log_file=$filename\_log
#echo "$filename_for_functions"

. records/records_functions/search/search_by_name.sh $filename

. records/utils/record_list_helper/select_or_show.sh $filename

###test
#example for how the logfile should be accessed from each function because they all set 2 levels down
#./ records/records_functions/search/search_record.sh $1
#log_filename="records/${filename}_log"

###test
#. records/utils/record_list_helper/just_show.sh $filename
#just_show "dark"

###test
#. records/utils/record_list_helper/select_or_show.sh $filename
#select_or_show "dark"

###test
. records/records_functions/insert_function/insert_record.sh $filename $filename\_log
. records/records_functions/delete_function/delete_record.sh $filename $filename\_log
. records/records_functions/update_quantity/update_record_quantity.sh $filename $filename\_log
. records/records_functions/update_name/update_name.sh $filename $filename\_log

if [[ "$#" -ne 1 ]]; then
	echo "Wrong script usage,must provide 1 positional argument" >&2
	echo "Usage: $0 filename" >&2
	echo "The filename is the records database" >&2
	exit 1
else
	if [[ ! -f "$filename" ]]; then
		echo "File was not found"
		#echo $(pwd)
		touch $filename
		touch $filename\_log
		if [[ $? -eq 0 ]]; then
			echo "File created successfully"
			echo "it's empty at the beginning, maybe start with inserting to it"
		else
			echo  "Something is wrong. Cannot create file.">&2
			exit 1
		fi
	fi
	###start main function###
	while :; do
		sleep 2
		menu_function
		read -p "Choose an option: " choice
		case $choice in
			a)
				insert_record ;;
		     	b)
				delete_record ;;
		     	c)
				search_by_name ;;
		     	d)
				update_record_name ;;
		     	e)
				update_record_quantity ;;
		     	f)
				echo display_records_sum ;;
		     	g)
				echo display_sorted_records ;;
			h)
				clean_exit ;;
			*)
				echo "Invalid choice. Please choose again." ;; 
		 esac 

		
	done
fi



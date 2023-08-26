#! /bin/bash

#source echo_menu_function.sh in order to use the menu_function inside it
. records/utils/record_list_helper/echo_menu_function.sh

#source clean_exit.sh in order to use the clean_exit function inside it
. records/records_functions/exit_function/clean_exit.sh

filename=$1
filename_for_functions='../../$1'
#example for how the logfile should be accessed from each function because they all set 2 levels down

#./ records/records_functions/search/search_record.sh $1
#log_filename="../../${filename}_log"
if [[ "$#" -ne 1 ]]; then
	echo "Wrong script usage,must provide 1 positional argument" >&2
	echo "Usage: $0 filename" >&2
	echo "The filename is the records database" >&2
	exit 1
else
	if [[ ! -f "records/$filename" ]]; then
		echo "File was not found"
		touch records/$filename
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
		menu_function

		read -p "Choose an option: " choice
		case $choice in
			a)
				echo insert_record ;;
		     	b)
				echo delete_record ;;
		     	c)
				echo search_by_name ;;
		     	d)
				echo update_name ;;
		     	e)
				echo update_quantity ;;
		     	f)
				echo display_records_sum ;;
		     	g)
				echo display_sorted_records ;;
			h)
				clean_exit ;;
			*)
				echo "Invalid choice. Please choose again." ;; 
		 esac 

		sleep 2
	done
fi



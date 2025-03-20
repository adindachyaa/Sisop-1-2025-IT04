#!/bin/bash

core="/home/rayakali/modul1/soal_2/scripts/core_monitor.sh"
frag="/home/rayakali/modul1/soal_2/scripts/frag_monitor.sh"
corelog_dir="/home/rayakali/modul1/soal_2/logs/core.log"
fraglog_dir="/home/rayakali/modul1/soal_2/logs/fragment.log"

add_core(){
	(crontab -l; echo "* * * * * $core >> $corelog_dir 2>&1") | crontab -
	sudo service cron restart
	echo "Core monitoring scheduled every one minute"
}

add_frag(){
	(crontab -l; echo "* * * * * $frag >> $fraglog_dir 2>&1") | crontab -
	sudo service cron restart
	echo "Fragment monitoring scheduled every one min"
}

rm_core(){
	echo "Removing core monitor.."
	(crontab -l | grep -v "core_monitor.sh") | crontab -
}

rm_frag(){
        echo "Removing fragment monitor.."
        (crontab -l | grep -v "frag_monitor.sh") | crontab -
}

while true
do
	echo "------------------------------------------------"
	echo "|              ARCAEA TERMINAL                  |"
	echo "------------------------------------------------"
	echo "| ID | OPTION                                   |"
	echo "------------------------------------------------"
	echo "| 1 | Add CPU - Core Monitor to Crontab         | "
	echo "| 2 | Add RAM - Fragment Monitor to Crontab     | "
	echo "| 3 | Remove CPU - Core Monitor from Crontab    | "
	echo "| 4 | Remove RAM - Fragment Monitor from Crontab| "
	echo "| 5 | View All Scheduled Monitoring Jobs        | "
	echo "| 6 | Exit Terminal                             |"
	echo "-------------------------------------------------"

	echo "Enter Option [1-6]: "
	read option

	case "$option" in
		"1")
			add_core
			read clr
			clear
			;;
		"2") 
			add_frag
			read clr
			clear
			;;
	        "3")
	                rm_core
			read clr
			clear
			;;
	        "4")
	                rm_frag
			read clr
			clear
			;;
	        "5")
	                crontab -l	
			;;
	        "6")
	                exit
			;;
	esac
done

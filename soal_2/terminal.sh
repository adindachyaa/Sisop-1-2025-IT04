#!/bin/bash

register_path="$HOME/modul1/soal_2/register.sh"
login_path="$HOME/modul1/soal_2/login.sh"

echo " ------------------------------"
echo "|    ARCAEA TERMINAL           |"
echo "|------------------------------|"
echo "|ID| OPTION                    |"
echo "| 1| Register New Account      |"
echo "| 2| Login to Existing Account |"
echo "| 3| Exit Arcaea Terminal      |"
echo " ______________________________"
echo " "
echo " Enter Option [1-3]: "
read option

case "$option" in
	"1")
		source $register_path
		;;
	"2")
		source $login_path
		;;
	"3")
		exit
esac

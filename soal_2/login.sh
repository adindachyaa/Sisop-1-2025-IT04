#!/bin/bash
 
manager_path="$HOME/modul1/soal2/scripts/manager.sh"
data_path="$HOME/modul1/soal2/data/player.csv"

while true
do
	echo "Enter username: "
	read username
	awk -F, -v un="$username" '$2==un {exit 1}' "$data_path";un_status=$?
	if ! [[ $un_status -eq 1 ]]
	then 
		echo "can't find your username"
	else
		echo "welcome" $username
		break	
	fi
done
while true
do
	echo "Enter password: "
	read password
	hash_pass=$(echo $password | sha256sum | awk '{print $1}')

	awk -F, -v pswd="$hash_pass" '$3==pswd {exit 1}' "$data_path";pswd_status=$?

	if ! [[ $pswd_status -eq 1 ]]
	then
		echo "wrong password"
	else 
		echo "ok welcome" 
		echo "Login Successful" 
		source $manager_path
		break
	fi
done




#!/bin/bash
 
data_path="$HOME/modul1/soal2/data/player.csv"

while true
do	
	echo "enter your email: "
	read email 

	awk -F, -v ei="$email" '$1==ei {exit 1}' "$data_path";e_status=$?

        if ! [[ $email =~ ^[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\.(com|ac.id)$ ]] 
        then
                echo "Invalid email"
        elif [[ $e_status -eq 1 ]]
	then
		echo "email has already registered"
	else
                echo "Welcome" $email
                break
        fi

done
echo "Enter username: "
read username

while true 
do
	echo "Enter password: "
	read password
	if ! [[ $password =~ ^[a-zA-Z0-9]{8,}$ && $password =~ [a-z] && $password =~ [A-Z] && $password =~ [0-9] ]]
	then
		echo "ur password doesn't match the requirements"
	else 
		echo "ok"
		break
	fi
done

hash_pass=$(echo $password | sha256sum | awk '{print $1}')

echo "$email,$username,$hash_pass" >>"$data_path"

echo "Registration Successful"

#!/bin/bash

spiktome(){
while true
do
	curl -s -H "Accept: application/json" "https://www.affirmations.dev" | jq -r '.affirmation'
	sleep 1
done
}

	
ontherun(){
for i in {1..100}; do
    sleep $(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
    printf "\rProgress: [%-100s] %d%%" $(printf "#%.0s" $(seq 1 $i)) $i
done
}

ctime() {
while true; do
clear
jam=$(date +"%H")

if [ $jam -ge  3 ] && [ $jam -lt 4 ]; then pesan="SAHUR WOI!"
elif [ $jam -ge 4 ] && [ $jam -lt 10 ]; then pesan="Selamat pagi, semangat beraktivitas!"
elif [ $jam -ge 10 ] && [ $jam -lt 15 ]; then pesan="Selamat siang, lemes gak nih? Wkwk."
elif [ $jam -ge 15 ] && [ $jam -lt 18 ]; then pesan="Selamat sore, ngabuburit ngapain? Jangan lupa nyari takjil!"
elif [ $jam -ge 18 ] && [ $jam -lt 20 ]; then pesan="Selamat berbuka puasa, sob. Sholat teraweh jangan lupa, ya!"
else pesan="Selamat malam, tidur sana."
fi

date +"%A, %B %d %Y - %H:%M:%S"
echo "︶︶︶︶︶︶︶︶୨♡୧︶︶︶︶︶︶︶︶"
echo "୨♡୧ ... $pesan"
sleep 1
done
}

dmoney() {
clear
tput civis
trap "tput cnorm; exit" SIGINT

simbol=("$" "€" "£" "¥" "¢" "₹" "₩" "₿" "₣")
rows=$(tput lines)
cols=$(tput cols)

while true; do
col=$((RANDOM % cols))
for ((i=0; i<rows; i++)); do
tput cup $i $col
char=${simbol[$((RANDOM % ${#simbol[@]}))]}
echo -ne "$color$char\033[95m"
sleep 0.001
done
done
}

if [[ "$1" == --play=* ]]
then
	track="${1#*=}"	

	if [[ "$track" == "Speak to Me" ]]
	then
		spiktome
	elif [[ "$track" == "On the Run" ]]
	then
		ontherun
	elif [[ "$track" == "Time" ]]
 	then
  		ctime
    	elif [[ "$track" == "Money" ]]
     	then
      		dmoney
 	else
		echo "sorry gaada lagu itu"
	fi
else
	echo "Usage: $0 --play=\"song name\""
	exit 1
fi	
		



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

if [[ "$1" == --play=* ]]
then
	track="${1#*=}"	

	if [[ "$track" == "Speak to Me" ]]
	then
		spiktome
	elif [[ "$track" == "On the Run" ]]
	then
		ontherun
	else
		echo "sorry gaada lagu itu"
	fi
else
	echo "Usage: $0 --play=\"song name\""
	exit 1
fi	
		



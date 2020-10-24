#!/bin/bash
sshkeyart()
{
	clear
	Chars=( "o" "o" "o" "=" "." "." "." " " "E" "B" "S" "X" "+" "0" "*" )
#	Loop=200
	XPos=$(( $(tput cols) / 2 ))
	YPos=$(( $(tput lines) / 2 ))
	for ((i=0; i<Loop; i++));do

	if 	[[ "$XPos" -eq "0" || "$XPos" -eq "$(tput cols)" ]] || \
		[[ "$YPos" -eq "0" || "$YPos" -eq "$(tput lines)" ]]
	then
#		printf "$XPos/$(tput cols) \t $YPos/$(tput lines) \t $i"
#		sleep 5
		break
	fi

	case $((RANDOM%2)) in
	    0)
	    ((YPos++)) ;;
	    1)
	    ((YPos--)) ;;
	esac

	case $((RANDOM%2)) in
	    0)
	    ((XPos++)) ;;
	    1)
	    ((XPos--)) ;;
	esac

	echo -en "\033[${YPos};${XPos}f${Chars[$((RANDOM%16))]}"
	read -t 0.01 -s
	done
}
re='^[0-9]+$'
if [[ ! -z "$1" ]] && [[ "$1" =~ $re ]]
then
	Loop="$1"
	if [[ "$@" == *"w"* ]]
	then
		while :
		do
			sshkeyart
		done
	else
		sshkeyart
	fi
else

	Loop=200
	sshkeyart
fi

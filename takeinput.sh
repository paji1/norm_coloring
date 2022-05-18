#!/bin/sh



RED='\033[1;31m'
RED_black='\033[0;31m'
GREEN='\033[1;32m'
GREEN_black='\033[0;32m'
YELLOW='\033[1;33m'
YELLOW_black='\033[0;33m'
CYAN='\033[1;36m'
CYAN_black='\033[0;36m'
PURPLE='\033[1;35m'
PURPLE_black='\033[0;35m'
WHITE='\33[1m'
NC='\033[0m'

printf "1 = $RED██ $NC"
printf "2 = $RED_black██ $NC"
printf "3 = $GREEN██ $NC\n\n"
printf "4 = $GREEN_black██ $NC"
printf "5 = $CYAN██ $NC"
printf "6 = $CYAN_black██ $NC\n\n"
printf "7 = $YELLOW██ $NC"
printf "8 = $YELLOW_black██ $NC"
printf "9 = $PURPLE██ $NC\n\n"
printf "10 = $PURPLE_black██ $NC"
printf "11 = $WHITE██ $NC\n"

echo ENTER COLOR1 NUMBER" :\n"
read num 

fun()
{

	if [ $1 = 1 ]
	then
		COLOR1=$RED
	elif [ $1 = 2 ]
	then
		COLOR1=$RED_black
	elif [ $1 = 3 ]
	then
		COLOR1=$GREEN
	elif [ $1 = 4 ]
	then
		COLOR1=$GREEN_black
	elif [ $1 = 5 ]
	then
		COLOR1=$CYAN
	elif [ $1 = 6 ]
	then
		COLOR1=$CYAN_black
	elif [ $1 = 7 ]
	then
		COLOR1=$YELLOW
	elif [ $1 = 8 ]
	then
		COLOR1=$YELLOW_black
	elif [ $1 = 9 ]
	then
		COLOR1=$PURPLE
	elif [ $1 = 10 ]
	then
		COLOR1=$PURPLE_black
	elif [ $1 = 11 ]
	then
		COLOR1=$WHITE
	fi
	export COLOR1
	echo $COLOR1 12
}
fun $num


#!/bin/sh

# Colors
RED='\033[0;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
PURPLE='\033[1;35m'
NC='\033[0m'

INSTALL_PATH="$HOME/Applications/bin"

if [ -z $1 ]
then
    norminette "." > file.txt
elif [ $1 = "--reset" ]; then
    $INSTALL_PATH/remove.sh
else
    norminette "$*" > file.txt
fi

awk -v RED=$RED -v GREEN=$GREEN  -v NC=$NC -v YELLOW=$YELLOW -v CYAN=$CYAN -v PURPLE=$PURPLE '
{
    is_file_line = match($0, /^.+\.[ch]/);
    if (is_file_line != 0)
    {
        if ($2 == "Error!")
            print $1 RED " " $2 NC
        else if ($2 == "OK!")
            print $1 GREEN " " $2 NC
    }
    else
    {
        printf RED $1 PURPLE " " $2" " NC $3;

        sub(/,/, ""); printf " " YELLOW $4 NC " "

        printf $5

        sub(/\):/, ""); printf " " YELLOW $6 NC ")" " \n\t"

        for (i = 7; i <= NF; ++i)
            printf CYAN $i NC " "; print "";
    }
}' file.txt
rm -rf file.txt

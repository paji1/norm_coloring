# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    normcolor.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tel-mouh <tel-mouh@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/16 19:16:44 by tel-mouh          #+#    #+#              #
#    Updated: 2022/05/17 05:43:58 by tel-mouh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh
if [ -z $1 ]
then
    norminette "." > file.txt
else
    norminette "$*" > file.txt
fi

RED='\033[0;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m'
awk -v RED=$RED -v GREEN=$GREEN  -v NC=$NC -v YELLOW=$YELLOW -v CYAN=$CYAN '
{
if (NR > 1 && $1 = "Error:")
printf RED $1 GREEN " " $2" "NC$3 YELLOW $4 NC $5 YELLOW $6 " " "\n\t" NC;
else
if ($2 != "Error!")
printf   $1 GREEN " " $2 ;
else
print $0
}{
if ($1 = "Error:")
for(i=7;i<=NF;i++) printf CYAN $i NC" "; print "";
}' file.txt
rm -rf file.txt &> /dev/null


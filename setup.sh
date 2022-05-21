#!/bin/bash

INSTALL_PATH="$HOME/Applications/normcolor"

GREEN='\033[1;32m'
NC='\033[0m'

SHELLRC=""

if [ -z $SHELL ]; then
	echo "Error. Cannot detect user's default shell"
	exit 1
fi

if [[ $SHELL == *"zsh" ]]; then
	SHELLRC="$HOME/.zshrc"
elif [ $SHELL = *"bash" ]; then
	SHELLRC="$HOME/.bashrc"
fi

mkdir -p $INSTALL_PATH
cp -f utils/normcolor.sh $INSTALL_PATH
if [ $? -ne 0 ]; then
	echo "Installation failed"
	exit 1
fi

cp -f utils/remove.sh $INSTALL_PATH
if [ $? -ne 0 ]; then
	echo "Installation failed"
	exit 1
fi

chmod u+x $INSTALL_PATH/normcolor.sh
chmod u+x $INSTALL_PATH/remove.sh

install_alias()
{
	grep "alias norminette=\"$INSTALL_PATH/normcolor.sh\"" $SHELLRC > /dev/null 2>&1
	if [ $? -ne 0 ]; then
		echo "alias norminette=\"$INSTALL_PATH/normcolor.sh\"" >> $SHELLRC
	fi
}
source utils/takeinput.sh

if [ -e "$SHELLRC" ]; then
	install_alias
else
	echo "Error. rc file does not exist"
	exit 1
fi

printf "${GREEN}Installation complete!$NC\n"
exec zsh

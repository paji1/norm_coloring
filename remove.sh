#!/bin/bash

INSTALL_PATH="$HOME/Applications/bin"

RED='\033[0;31m'
NC='\033[0m'

SHELLRC=""

if [ -z $SHELL ]; then
	echo "Error. Cannot detect user's default shell"
	exit 1
fi

if [[ $SHELL == *"zsh" ]]; then
	SHELLRC="$HOME/.zshrc"
elif [[ $SHELL == *"bash" ]]; then
	SHELLRC="$HOME/.bashrc"
fi

cp $SHELLRC ${SHELLRC}.pre-normcolor

awk -v INSTALL_PATH="$INSTALL_PATH" '
{
	sub(/.*normcolor.sh"$/, ""); print $0
}' $SHELLRC.pre-normcolor > $SHELLRC

cd $HOME
rm -rf $INSTALL_PATH
printf "${RED}norminette was reset to default successfully$NC\n"
cd - > /dev/null 2>&1
exec zsh

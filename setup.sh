#!/bin/sh

INSTALL_PATH="$HOME/Applications/bin"

mkdir -p $INSTALL_PATH
cp -f normcolor.sh $INSTALL_PATH
cp -f remove.sh $INSTALL_PATH
echo "alias norminette=\"$INSTALL_PATH/normcolor.sh\"" >> ~/.zshrc
exec zsh

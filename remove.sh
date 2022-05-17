#!/bin/sh

INSTALL_PATH="$HOME/Applications/bin"

echo "unalias norminette" >> ~/.zshrc
cd $HOME
rm -rf $INSTALL_PATH
exec zsh

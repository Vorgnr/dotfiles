#!/bin/bash
#
# Installation of the Awesome WM
#
if test ! $(which awesome)
then
	echo "  Installing awesome for you"
	sudo apt-get -y install awesome awesome-extra
fi

if [ ! -h $HOME/.config/awesome ]
then
	echo "  Configuring awesome for you"
	ln -s $DOTFILES/awesome/config $HOME/.config/awesome
fi

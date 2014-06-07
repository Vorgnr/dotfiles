#!/bin/bash
#
# Installation of the Awesome WM
# Version : 3.5
if test ! $(which awesome)
then
	echo "  Installing awesome for you"
	sudo add-apt-repository -y ppa:klaus-vormweg/ppa
	sudo apt-get update
	sudo apt-get -y install awesome awesome-extra
fi

if [ ! -h $HOME/.config/awesome ]
then
	echo "  Configuring awesome for you"
	dotfiles_root=`pwd`
	ln -s ${dotfiles_root}/awesome/config $HOME/.config/awesome
fi

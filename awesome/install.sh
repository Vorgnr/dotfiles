#!/bin/bash
#
# Installation of the Awesome WM
#

if test ! $(which awesome)
then
	echo "  Installing awesome for you"
	sudo add-apt-repository ppa:ey3ball/awesome 
	sudo apt-get update
	sudo apt-get -y install awesome awesome-extra
fi
#!/bin/bash
#
# Installation of the Atome Text Editor
#
if test ! $(which atom)
then
  echo "  Installing atom for you"
  sudo add-apt-repository ppa:webupd8team/atom
  sudo apt-get update
  sudo apt-get -y install atom
fi

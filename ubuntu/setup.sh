#!/bin/bash
#
# Ubuntu
#
# This installs some of the common dependencies needed (or at least desired)
# using Aptitude.

# Directory to use to temporary download DEB packages
FETCH_DESTINATION_DIR="${HOME}/Downloads/"

# Check for apt-get
if test ! $(which apt-get)
then
  echo "  No apt-get found. Die please."
  exit 1
fi

# http://doc.ubuntu-fr.org/java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update
sudo apt-get install oracle-java7-installer

# Install packages from repositories
TO_INSTALL=(
	'curl'
	'vim'
	'xclip'
	'zsh'
	'git'
	'git-gui'
	'bash-completion'
  'xscreensaver'
)

INSTALL_COMMAND=$(printf " %s" "${TO_INSTALL[@]}")
INSTALL_COMMAND=${INSTALL_COMMAND:1}
sudo apt-get -y install $INSTALL_COMMAND

exit 0

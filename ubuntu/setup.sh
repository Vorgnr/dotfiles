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

# Install packages from repositories
TO_INSTALL=(
	'ack-grep'
	'curl'
	'dmenu'
	'grc'
	'htop'
	'vim'
	'xclip'
	'zsh'
	'php5'
	'mysql-server'
	'apache2'
	'phpmyadmin'
	'git'
	'git-gui'
	'gitk'
	'git-flow'
	'bash-completion'
	'gcolor2'
	'gimp'
	'shutter'
	'filezilla'
	'meld'
	'poedit'
	'kcachegrind'
)
INSTALL_COMMAND=$(printf " %s" "${TO_INSTALL[@]}")
INSTALL_COMMAND=${INSTALL_COMMAND:1}
sudo apt-get install $INSTALL_COMMAND

# Install DEB packages
TO_FETCH=(
	'https://download.toggl.com/toggldesktop/latest/toggl-desktop_current_amd64.deb'
)
if test ! $(which google-chrome)
then
	TO_FETCH[1]='https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
fi

mkdir -p ${FETCH_DESTINATION_DIR}
rm ${FETCH_DESTINATION_DIR}/*.deb
for DEB_URL in ${TO_FETCH[@]}
do
	wget ${DEB_URL} -P ${FETCH_DESTINATION_DIR}
done
sudo dpkg -i ${FETCH_DESTINATION_DIR}/*.deb
rm ${FETCH_DESTINATION_DIR}/*.deb

# Other installs
## Hub: http://hub.github.com/
mkdir -p ~/bin/
curl http://hub.github.com/standalone -sLo ~/bin/hub
chmod +x ~/bin/hub

# Install Autocompletion:
# 	http://mbuttu.wordpress.com/2011/07/11/git-autocomplete-for-bash-shells/
# 	https://github.com/bobthecow/git-flow-completion
sudo wget "https://raw.github.com/git/git/master/contrib/completion/git-completion.bash" -O /etc/bash_completion.d/git-completion.bash
sudo wget "https://raw.github.com/bobthecow/git-flow-completion/master/git-flow-completion.bash" -O /etc/bash_completion.d/git-flow-completion.bash

exit 0

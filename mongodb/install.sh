#!/bin/bash

if test ! $(which mongod)
then
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
  sudo apt-get update
  sudo apt-get install mongodb-org
fi

if [ -f /etc/mongod.conf ]
then
    sudo rm /etc/mongod.conf
fi

DOTFILES=`pwd`
SOURCE="$DOTFILES/mongodb/mongodb.conf"
DEST="/etc/mongodb.conf"
sudo ln -s $SOURCE $DEST

if test ! $(wich robomongo)
then
  sudo wget -P /tmp http://robomongo.org/files/linux/robomongo-0.8.3-x86_64.deb
  sudo dpkg -i /tmp/robomongo-0.8.3-x86_64.deb
fi

#!/bin/bash

if test ! $(which node)
then
  # See https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#ubuntu-mint-elementary-os
  echo "  Installing nodejs for you."
  sudo apt-get update
  sudo apt-get install -y python-software-properties python g++ make
  sudo add-apt-repository -y ppa:chris-lea/node.js
  sudo apt-get update
  sudo apt-get -y install nodejs
fi

npm config set registry http://registry.npmjs.eu/

if test ! $(which grunt)
then
  echo "  Installing grunt-cli for you."
  sudo npm install -g grunt-cli
fi

if test ! $(which bower)
then
  echo "  Installing bower for you."
  sudo npm install -g bower
fi

if test ! $(which lessc)
then
  echo "  Installing less for you."
  sudo npm install -g less
fi

if test ! $(which jasmine-node)
then
  echo "  Installing Jasmine for you."
  sudo npm install -g jasmine-node
fi

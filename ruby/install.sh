#!/bin/sh

if test ! $(which rbenv)
then
  echo "  Installing rbenv for you."
  sudo apt-get install rbenv
fi

if test ! $(which ruby-build)
then
  echo "  Installing ruby-build for you."
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
else
  cd ~/.rbenv/plugins/ruby-build && git pull
fi

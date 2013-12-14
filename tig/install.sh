#!/bin/bash
# See http://jonas.nitro.dk/tig/INSTALL.html

install_tig() {
  local SOURCES=$ZSH/tig/sources

  if test ! $(which tig)
  then
    echo "  Installing tig for you."
    sudo apt-get install libncurses5-dev libncursesw5-dev # https://github.com/jonas/tig/issues/39
    git clone -b release http://github.com/jonas/tig $SOURCES
    cd $SOURCES
    make configure
    ./configure
    make prefix=~
    make install prefix=~
  fi
}

install_tig

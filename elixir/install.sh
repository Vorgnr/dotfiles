#!/bin/bash
# See http://elixir-lang.org/getting_started/1.html

install_remote_deb() {
  local FILE=`mktemp`
  local URL=$1

  wget "$URL" -O $FILE
  sudo dpkg -i $FILE
  sudo apt-get -yf install # needed in case the package has unmet dependencies

  rm -f $FILE
}

install_elixir() {
  local SOURCES=$DOTFILES/elixir/sources

  # [todo] - Add an option to update Elixir if it is already installed
  if test ! $(which elixir)
  then
    echo "  Installing elixir for you."
    git clone -b stable https://github.com/elixir-lang/elixir.git $SOURCES
    cd $SOURCES
    make clean test
  fi
}

if test ! $(which erl)
then
  echo "  Installing erlang for you."
  install_remote_deb "http://packages.erlang-solutions.com/erlang/esl-erlang/FLAVOUR_1_general/esl-erlang_16.b.3-1~ubuntu~precise_amd64.deb"
fi

install_elixir

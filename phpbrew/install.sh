#!/usr/bin/env bash

set -e

echo ''

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

install_phpbrew() {
  local action overwrite backup skip
  local PHPBREW_PATH=$HOME/.phpbrew

  info 'Installing phpbrew…'

  if [ -e "$PHPBREW_PATH" ]
  then
    user ' $PHPBREW_PATH already exists, what do you want to do? [o]verwrite, [b]ackup, [s]kip?'
    read -n 1 action < /dev/tty

    case "$action" in
      o )
        overwrite=true;;
      b )
        backup=true;;
      s )
        skip=true;;
      * )
        ;;
    esac

    if [[ "$overwrite" == "true" ]]
    then
      rm -rf $PHPBREW_PATH
      success 'Removed $PHPBREW_PATH'
    fi

    if [[ "$backup" == "true" ]]
    then
      mv $PHPBREW_PATH $PHPBREW_PATH.backup
      success 'Moved $PHPBREW_PATH to $PHPBREW_PATH.backup'
    fi
  fi

  if [[ "$skip" == "" ]]
  then
    wget https://raw.github.com/c9s/phpbrew/master/phpbrew -O phpbrew.bin > /dev/null
    chmod +x phpbrew.bin > /dev/null
    sudo mv phpbrew.bin /usr/bin/phpbrew > /dev/null

    /usr/bin/phpbrew init > /dev/null
    /usr/bin/phpbrew lookup-prefix ubuntu
    /usr/bin/phpbrew install-composer
    /usr/bin/phpbrew install-phpunit
  fi
}

install_phpbrew

#!/bin/bash
#
# Installation of Zeal
# Offline API documentation browser

if test ! $(which zeal)
then
  echo "  Installing zeal for you"
  sudo add-apt-repository ppa:jerzy-kozera/zeal-ppa
  sudo apt-get update
  sudo apt-get install zeal
fi

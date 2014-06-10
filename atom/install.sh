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

  packages=(
    "script"
    "language-lua"
    "cut-line"
    "atom-monokai"
    "merge-conflicts"
    "atom-zeal"
  )

  echo "  Installing packages ..."
  for i in "${packages[@]}"i
  do
    apm install $i
  done

  echo "  Configuring atom for you"
  dotfiles_root=`pwd`

  for source in `find ${dotfiles_root}/atom/config -name \*.cson`
  do
    file_name=`basename ${source}`
    dest=$HOME/.atom/${file_name}
    ln -s $source $dest
    echo "Linked $sourc to $dest"
  done
fi

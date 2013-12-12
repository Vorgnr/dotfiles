#!/bin/sh

# [todo] - Add a check for the current shell and do nothing if it is ZSH
#if test ! $(which rbenv)
#then
  echo "  Setting ZSH as default shell for you."
  chsh -s /bin/zsh `whoami`
#fi

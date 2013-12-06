#!/bin/bash
# Installation file for new system, use as desired.

## 1. Set up the tent directory and checkout code from github
## 2. Link ~/.profile to $TENT/config/bash.profile, or source it directly
## 3. (Mac) Set Terminal theme to this one: open $TENT/config/boris.terminal
## 4. (Mac) Install homebrew and helper programs
#      ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
#      brew doctor
#      brew install git
#      brew install ctags
#      brew install ack
## 5. Set up Vim:
##     4a. (Mac) Install MacVim
##     4b. Install Vim configuration   ######## sh <(curl https://j.mp/spf13-vim3 -L)
#          git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
#          ln -s ~/.tent/config/vim.vimrc ~/.vimrc
#          vim +BundleInstall +qall
#  6. Set up gdb:
#      ln -s $TENT/config/gdb.config  ~/.gdbinit
# check this out
# http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html

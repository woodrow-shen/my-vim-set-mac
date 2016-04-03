#!/bin/sh

# install ycm
mkdir -p $HOME/.vim/bundle
cd $HOME/.vim/bundle 
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive

./install.py --clang-completer --gocode-completer

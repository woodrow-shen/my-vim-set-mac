#!/bin/sh
# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install vim
brew isntall vim

# install go
brew install go

cat << EOF >> $HOME/.bash_profile
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
EOF

source $HOME/.bash_profile

# install ycm
mkdir -p $HOME/.vim/bundle
cd $HOME/.vim/bundle 
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive

./install.py --clang-completer --gocode-completer

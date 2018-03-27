#!/bin/sh
# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install vim
brew install vim

# install go
brew install go

cat << EOF >> $HOME/.bash_profile
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

EOF

source $HOME/.bash_profile

# copy .vim/
cp -r .vim ~/
cp .vimrc ~/

# install ycm
mkdir -p $HOME/.vim/bundle
cd $HOME/.vim/bundle 
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive

./install.py --clang-completer --gocode-completer

cp .ycm_extra_conf.py ~/

# install git
brew install bash-git-prompt

cat << EOF >> $HOME/.bash_profile
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

EOF

source ~/.bash_profile

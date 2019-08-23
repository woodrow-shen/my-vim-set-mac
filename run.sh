#!/bin/bash
#set -x
set -e
CURDIR=$PWD

cat << EOF >> ~/.bash_profile
alias ll='ls -laG'

export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

EOF

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install vim
brew install vim

# install ctags
brew install ctags

cat << EOF >> ~/.bash_profile
alias ctags="`brew --prefix`/bin/ctags"

EOF

# install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# copy the vim default folders
cd "$CURDIR"
cp -r .vim ~/
cp .vimrc ~/

# install vim plugin
vim +PluginInstall +qall

# install go (required >= 1.11 due to YCM)
brew install go

cat << EOF >> $HOME/.bash_profile
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

EOF

source "$HOME"/.bash_profile

# install ycm
cd "$HOME"/.vim/bundle
cd YouCompleteMe

python3 ./install.py --clang-completer --gocode-completer

cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim/

# install all the necessary binaries for vim-go
vim +GoInstallBinaries +qall

# install git-prompt-bash
brew install bash-git-prompt

cat << EOF >> ~/.bash_profile
# install git-prompt-bash
GIT_PROMPT_THEME="Single_line_Ubuntu"
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
	__GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
	source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

EOF

# install bash completion
brew install bash-completion
# install git completion
if [ ! -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
	echo "No git-completion.bash installed on system!"
	exit 1
fi

# TODO: the path could be changed according to bash-completion version
cp /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash /usr/local/Cellar/bash-completion/1.3_3/etc/bash_completion.d/
cat << EOF > ~/.bash_profile
# install git completion
source /usr/local/etc/bash_completion.d/git-completion.bash
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

EOF

# create SSH key by default
ssh-keygen -f id_rsa -t rsa -N ''

#
# .bashrc
#
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

#
# bash_completion
#
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

#
# path
#
export PATH=$HOME/.local/bin:$PATH  #for home local

#
# go
#
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
#export GO15VENDOREXPERIMENT=1 # for glide

#
# .bash_profile_local
#
if [ -f ~/.bash_profile_local ]; then
	. ~/.bash_profile_local
fi

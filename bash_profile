#
# .bashrc
#
#if [ -f ~/.bashrc ]; then
#	source ~/.bashrc
#fi

#
# bash_completion
#
[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion

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
	source ~/.bash_profile_local
fi

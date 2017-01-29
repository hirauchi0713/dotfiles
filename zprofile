#
# .zshrc
#
if [ -f ~/.zshrc ]; then
	source ~/.zshrc
fi

#
# .zprofile_local
#
if [ -f ~/.zprofile_local ]; then
	source ~/.zprofile_local
fi

#
# path
#
export PATH=$HOME/.local/bin:$PATH  #for home local
export XDG_CONFIG_HOME="$HOME/.config"

#
# go
#
#export GOROOT=/usr/local/go
#export PATH=$PATH:$GOROOT/bin
#export GOPATH=$HOME/.go
#export PATH=$PATH:$GOPATH/bin
#export GO15VENDOREXPERIMENT=1 # for glide

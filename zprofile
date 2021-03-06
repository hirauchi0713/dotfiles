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

#
# go
#
#export GOROOT=/usr/local/go
#export PATH=$PATH:$GOROOT/bin
#export GOPATH=$HOME/.go
#export PATH=$PATH:$GOPATH/bin
#export GO15VENDOREXPERIMENT=1 # for glide

#
# ruby(rbenv)
#
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

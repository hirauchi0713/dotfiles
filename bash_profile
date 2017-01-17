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
export PATH=$HOME/.local/bin:$HOME/bin:$PATH

#
# .bash_profile_local
#
if [ -f ~/.bash_profile_local ]; then
	. ~/.bash_profile_local
fi

#
# rbenv
#
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#
# rbenv(for install)
#
export CPATH=/usr/local/include:$CPATH
export LD_LIBRARY_PATH=$HOME/local/lib:/usr/local/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$HOME/local/lib:/usr/local/lib:$LIBRARY_PATH
export TMPDIR=$HOME/tmp

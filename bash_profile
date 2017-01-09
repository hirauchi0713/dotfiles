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

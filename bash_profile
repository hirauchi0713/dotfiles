#
# .bashrc
#
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

#
# path
#
export PATH=$PATH:$HOME/.local/bin:$HOME/bin

#
# .bash_profile_local
#
if [ -f ~/.bash_profile_local ]; then
	. ~/.bash_profile_local
fi

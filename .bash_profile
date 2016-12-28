# .bash_profile
HOST_NICKNAME=*UNKNOWN_HOST*
export PS1="($HOST_NICKNAME) \W $ "

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

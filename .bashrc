# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias dl='docker ps -l -q'
alias da='docker ps -a'

alias .v='vi ~/.bashrc'
alias .b='. ~/.bashrc'


#dir bookmarks
function .add() {
  echo "alias .${1}='cd $(pwd)'">>~/.dirs_bookmarks.sh
  . ~/.dirs_bookmarks.sh
}

#
# global rc
#
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#
# prompt
#
export PS1='[\h \t] \W \$ '

#
# alias
#
alias la='ls -lat'
alias dl='docker ps -l -q'
alias da='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'

alias vip='vi ~/.bash_profile'
alias vir='vi ~/.bashrc'
alias vil='vi ~/.bash_profile_local'
alias so='source ~/.bash_profile'

#
# dir bookmarks
#
function dadd() {
  echo "alias ${1}='cd $(pwd)'">>~/.dirs_bookmarks.sh
  . ~/.dirs_bookmarks.sh
}
function dadd-l() {
  cat ~/.dirs_bookmarks.sh
}
if [ -f ~/.dirs_bookmarks.sh ]; then
  . ~/.dirs_bookmarks.sh
fi

#
# host bookmarks
#
function hadd() {
  echo "alias ${1}='ssh ${1}'">>~/.hosts_bookmarks.sh
  . ~/.hosts_bookmarks.sh
}
if [ -f ~/.hosts_bookmarks.sh ]; then
	. ~/.hosts_bookmarks.sh
fi

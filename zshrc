######################################################################
# プロンプト
setopt prompt_subst
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "+"
zstyle ':vcs_info:*' formats '%F{green}[%b] %c%u%f'
zstyle ':vcs_info:*' actionformats '%F{red}[%b|%a] %c%u%f'
function _update_vcs_info_msg() {
	LANG=en_US.UTF-8 vcs_info
	RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


######################################################################
# alias
#
alias la='ls -lat'
alias dl='docker ps -l -q'
alias da='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'

alias vip='vi ~/.zprofile'
alias vir='vi ~/.zshrc'
alias vil='vi ~/.zprofile_local'
alias so='source ~/.zprofile'

######################################################################
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

######################################################################
# host bookmarks
#
function hadd() {
  echo "alias ${1}='ssh ${1}'">>~/.hosts_bookmarks.sh
  . ~/.hosts_bookmarks.sh
}
if [ -f ~/.hosts_bookmarks.sh ]; then
	. ~/.hosts_bookmarks.sh
fi

######################################################################
# Node.js
#
if [ -f ~/.nvm/nvm.sh ]; then
	source ~/.nvm/nvm.sh
fi

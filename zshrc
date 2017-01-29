######################################################################
# setopt
#
setopt interactive_comments
setopt auto_list
setopt auto_menu
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt ignore_eof #^Dでシェルを終了しない
setopt inc_append_history
setopt magic_equal_subst
setopt notify
setopt print_eight_bit
setopt print_exit_value
setopt pushd_ignore_dups
setopt rm_star_wait
setopt share_history
setopt auto_cd

######################################################################
# prompt
#

autoload -Uz colors
colors

function git_branch() {
	echo -n "[$(git name-rev --name-only HEAD 2> /dev/null)]"
}

function git_status() {
	if [[ $(git status --porcelain 2>/dev/null | tail -n1) ]]; then
		echo -n "%{$fg[red]%} x %{${reset_color}%}"
	else
		echo -n "%{$fg[green]%} o %{${reset_color}%}"
	fi
}

setopt prompt_subst
setopt transient_rprompt
local p_host="%{$terminfo[bold]$fg[black]}%}%{${bg[white]}%}[%m]%{${reset_color}%}"
local p_cdir="%F{cyan}[%~]%f"
local p_git='%F{blue}$(git_branch)%f'
local p_gitst='$(git_status)'
PROMPT="
$p_cdir$p_git$p_gitst
$p_host %* %# "

#autoload -Uz vcs_info
#zstyle ':vcs_info:git:*' check-for-changes true
#zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
#zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
#zstyle ':vcs_info:git:*' formats "%F{green}%c%u[%b]%f"
#zstyle ':vcs_info:git:*' actionformats '[%b|%a] '
#
#precmd () { vcs_info }
#RPROMPT='${vcs_info_msg_0_}'"[%* %n@%m]"
#PROMPT="%~ %# "

######################################################################
# zplug
#
#export ZPLUG_HOME=$HOME/.zplug
#source $ZPLUG_HOME/init.zsh
#
#zplug "zsh-users/zsh-history-substring-search"
#
## source plugins and add commands to $PATH
#zplug load --verbose

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

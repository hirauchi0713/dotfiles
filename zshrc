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
setopt RM_STAR_SILENT # rm *で確認を求める機能を無効化

######################################################################
# prompt
#

autoload -Uz colors
colors

function git_prompt() {
	local branch=$(git name-rev --name-only HEAD 2> /dev/null)
	if [[ -n $branch ]]; then
		local p_branch="%{$fg[blue]%}[$branch]%{$reset_color%}"
		local p_status
		if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
			p_status="%{$fg[red]%} x %{${reset_color}%}"
		else
			p_status="%{$fg[green]%} o %{${reset_color}%}"
		fi
		echo -n "$p_branch$p_status"
	fi
}

setopt prompt_subst
#setopt transient_rprompt
local p_host="[%m]"
local p_cdir="%F{cyan}[%~]%f"
local p_git='$(git_prompt)%f'
PROMPT="
$p_cdir$p_git
$p_host %* %# "

######################################################################
# alias
#
if test "$HOST" = "hhmac.local"; then
	alias ls='ls -G'
elif test "$HOST" = "hhmac"; then
	alias ls='ls -G'
else
	alias ls='ls --color'
fi

alias la='ls -la'
alias ll='ls -l'
alias dl='docker ps -l -q'
alias da='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'

alias vi='vim'
alias vip='vi ~/.zprofile'
alias vir='vi ~/.zshrc'
alias vil='vi ~/.zprofile_local'
alias vit='vi ~/.memo'
alias so='source ~/.zprofile'

alias lg='git lg'
alias lga='git lga'
alias st='git st'
alias cm='git commit -m'
alias cma='git commit -am'
alias add='git add'
alias dif='git diff'
alias difc='git diff HEAD HEAD^'
alias hardreset='git reset --hard HEAD'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sort'
alias -g W='| wc'
alias -g X='| xargs'

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
# autojump
#
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

######################################################################
# iTerm2
#

#
# シェル統合
#
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#
# タブの色を変える
#
#引数: R G B
tab-color() {
  echo -ne "\033]6;1;bg;red;brightness;$1\a"
  echo -ne "\033]6;1;bg;green;brightness;$2\a"
  echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}

#
# タブの色を戻す
#
tab-reset() {
  echo -ne "\033]6;1;bg;*;default\a"
}

#
# タブの名前を変える
#
tab-name() {
  echo -ne "\033]0;$1\007"
}

#
# rootの時はタブを赤くする
#
superuser() {
  tab-color 200 0 0
  su
  tab-reset
}


#
# pyenv
#
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#
# java
#
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

#
# node(nodebrew)
#
export PATH=$HOME/.nodebrew/current/bin:$PATH

#
# local settings
#
source ~/.env

# mac aws
#
source /usr/local/share/zsh/site-functions/aws_zsh_completer.sh
alias ec2app="ssh -i $EC2_PEM  $EC2_USER@$EC2_HOST"
alias ec2mid="ssh -i $EC2_PEM  $MID_USER@$MID_HOST"



######################################################################
# gr8
#
alias gr8='./gr8'
alias gsource='source setenv.sh'
alias ghist='gr8 hist'
alias gnew='gr8 new'
alias gedit='gr8 edit'
alias gshow='gr8 show'
alias gup='gr8 up'
alias gdown='gr8 down'
alias gredo='gr8 redo'
alias gedithist='vi migr8/history.txt'
alias ghistedit='gedithist'
alias d='(){ psql postgres -c "\d+ $1" }'
alias dT='(){ psql postgres -c "\dT+ $1" }'
alias gg='ghist | grep'

######################################################################
# perl
#
PATH="/Users/hirauchi/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/hirauchi/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/hirauchi/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/hirauchi/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/hirauchi/perl5"; export PERL_MM_OPT;



######################################################################
# ssh
#
alias devops="tab-color   0 200   0; tab-name devops; ssh devops; tab-reset; tab-name ${HOST}"
alias   mock="tab-color 200   0   0; tab-name mock;   ssh mock;   tab-reset; tab-name ${HOST}"
alias serval="tab-color   0   0 200; tab-name serval; ssh serval; tab-reset; tab-name ${HOST}"
alias     hh="tab-color 200   0 200; tab-name hh;     ssh hh;     tab-reset; tab-name ${HOST}"

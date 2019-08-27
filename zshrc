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
PROMPT="$p_cdir$p_git
$p_host %* %# "

######################################################################
# alias
#
if test "$HOST" = "hhmac.local"; then
	alias ls='ls -G'
elif test "$HOST" = "hhmac"; then
	alias ls='ls -G'
elif test "$HOST" = "hhmbp2.local"; then
	alias ls='ls -G'
else
	alias ls='ls --color'
fi

alias la='ls -la'
alias ll='ls -l'

alias vi='vim'
alias vip='vi ~/.zprofile'
alias vir='vi ~/.zshrc'
alias vil='vi ~/.zprofile_local'
alias vit='vi ~/.memo'
alias so='source ~/.zprofile'
alias sor='source ~/.zshrc'

##############################
# git
#
alias lga='git lga'
alias difc='git diff HEAD HEAD^'
alias hardreset='git reset --hard HEAD'

alias commit='git commit'
alias push='git push'
alias pull='git pull'
alias add='git add'
alias dif='git diff'
alias co='git checkout'
alias lg='git lg'
alias st='git st'
alias br='git branch'

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
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

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
# source /usr/local/share/zsh/site-functions/aws_zsh_completer.sh
# alias ec2app="ssh -i $EC2_PEM  $EC2_USER@$EC2_HOST"
# alias ec2mid="ssh -i $EC2_PEM  $MID_USER@$MID_HOST"


######################################################################
# perl
#
PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;


######################################################################
# ssh
#
alias devops="tab-color   0 200   0; tab-name devops; ssh devops; tab-reset; tab-name ${HOST}"
alias   mock="tab-color 200   0   0; tab-name mock;   ssh mock;   tab-reset; tab-name ${HOST}"
alias serval="tab-color   0   0 200; tab-name serval; ssh serval; tab-reset; tab-name ${HOST}"
alias     hh="tab-color 200   0 200; tab-name hh;     ssh hh;     tab-reset; tab-name ${HOST}"


######################################################################
# yarn
#
alias ya="yarn"


######################################################################
# docker
#
alias dl='docker ps -l -q'
alias da='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dc='docker-compose'


######################################################################
# tmux
#
alias tmux='tmux -u'


######################################################################
# user local bin
#
PATH=/usr/local/bin:$PATH

######################################################################
# rbenv
#
eval "$(rbenv init -)"

######################################################################
#
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/hirauchi0713/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/hirauchi0713/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/hirauchi0713/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/hirauchi0713/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

######################################################################
# others
#
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH=$PATH:~/.roswell/bin


######################################################################
# PHP
#
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/php@7.2/lib"
export CPPFLAGS="-I/usr/local/opt/php@7.2/include"
 source ~/perl5/perlbrew/etc/bashrc

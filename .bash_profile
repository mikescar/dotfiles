# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
export EDITOR=/usr/bin/vim
export PAGER=/usr/bin/less

# convenience settings & functions
. ~/bin/.colors
. ~/bin/git-completion.sh
. ~/bin/git-helper.sh

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set PS1 based on environment
case $TERM in
xterm*)
if [ `declare -F __git_ps1` ]
then
	PS1="\[\033[01;32m\]\u@\h \t${RESET}:${CYAN}\w ${WHITE}\$(__git_ps1 '(%s)')${RESET}\$ "
	GIT_PS1_SHOWDIRTYSTATE=1
else
	PS1="\[\033[01;32m\]\u@\h \t${RESET}:${CYAN}\w ${WHITE}\$ "
fi
;;
*)
PS1="\h:\w \u\$ "
;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac


alias cdp='cd -P'
alias cl='clear'
alias df='df -h'
alias du='du -sch'
alias egrep='egrep --color'
alias hgrep='history 1000 | grep '
alias psgrep='ps aux | grep '
alias k9='kill -9'
alias l='less'
alias ll='ls -lahp'
alias psg='ps aux | grep -i'
alias sit='source ~/.bash_profile'
alias tailsql='tail -fn600 /home/y/logs/yapache/sql_error'
alias tailweb='tail -fn600 /home/y/logs/yapache/php_error'
alias tailroute='tail -fn600 /home/y/logs/yapache/route_error'
alias uname='uname -a'
alias vi='/usr/bin/vim'
alias mysqlstart='sudo launchctl load /Library/LaunchDaemons/org.macports.mysql55-server.plist'
alias mysqlstop='sudo launchctl unload /Library/LaunchDaemons/org.macports.mysql55-server.plist'
alias mysqlrestart='mysqlstop && mysqlstart'
alias memstart='sudo launchctl load -w /Library/LaunchDaemons/org.macports.memcached.plist'
alias memstop='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.memcached.plist'
alias memrestart='memstop && memstart'
alias tarz='tar zxvpf'
alias portupdate='sudo port selfupdate; sudo port upgrade outdated'
alias updatedb="sudo /usr/libexec/locate.updatedb"
alias psql="psql -U postgres "
# git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gba='git branch -a'
alias gc='git co '
alias gd='git diff -p --stat'
alias gg='git grep -n'
alias ggi='git grep -ni'
alias gl='git lg'
alias gll='git lc | grep -vi "merge"'
alias gx='gitx --all'
alias gsr='git svn rebase'
alias gsf='git svn fetch'
alias gcp='git cherry-pick'
alias gph='git push heroku'
# git root dir
alias gr='cd $(git rev-parse --show-cdup)'

# save a lot of history
HISTFILESIZE=1000000
HISTSIZE=10000

# gpg key
export GPGKEY=489265C3

source ~/.bashrc
PATH=$PATH:~/bin:/opt/local/bin:/opt/local/sbin:/opt/local/lib/postgresql93/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


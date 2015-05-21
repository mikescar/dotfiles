# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
export EDITOR=/usr/bin/vim

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

# some more aliases
alias cdp='cd -P'
alias cl='clear'
alias df='df -h'
alias du='du -sch'
alias egrep='egrep --color'
alias hgrep='history 1000 | grep '
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
alias tarz='tar zxvpf'
alias portupdate='sudo port selfupdate; sudo port upgrade outdated'

# git helper bash functions and aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gba='git branch -a'
alias gc='git co '
alias gd='git diff -p --stat'
alias gg='git grep'
alias ggi='git grep -i'
alias gl='git lg'
alias gll='git lc | grep -vi "merge"'
alias gx='gitx --all'
alias gsr='git svn rebase'
alias gsf='git svn fetch'
alias gcp='git cherry-pick'
alias gph='git push heroku'
alias gr='cd $(git rev-parse --show-cdup)'
alias updatedb="sudo /usr/libexec/locate.updatedb"
alias psql="psql -U postgres "


# save a lot of history
HISTFILESIZE=1000000
HISTSIZE=10000

# gpg key
export GPGKEY=489265C3

source ~/.bashrc
source ~/.profile

# MacPorts Installer addition on 2012-05-23_at_09:39:15: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/apache2/bin:/opt/local/lib/php:/opt/local/lib/php/pear/bin:/opt/local/lib/mysql55/bin:/opt/local/lib/postgresql94/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

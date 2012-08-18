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
	PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:${CYAN}\w ${WHITE}\$(__git_ps1 '(%s)')${RESET}\$ "
	GIT_PS1_SHOWDIRTYSTATE=1
else
	PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:${CYAN}\w ${WHITE}\$ "
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
alias Less='less'
alias L='less'
alias ll='ls -lah'
#alias less='less -IgMN -x4'
alias psg='ps aux | grep -i'
alias sit='source ~/.bashrc'
alias tailsql='tail -fn600 /home/y/logs/yapache/sql_error'
alias tailweb='tail -fn600 /home/y/logs/yapache/php_error'
alias tailroute='tail -fn600 /home/y/logs/yapache/route_error'
alias uname='uname -a'
alias vi='/usr/bin/vim'
alias yssh='profilepush'

# SVN aliases
alias sup='svn up'
alias sl='svn log --stop-on-copy'

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
alias go='git checkout '
alias gx='gitx --all'
alias gsr='git svn rebase'
alias gsf='git svn fetch'
alias gcp='git cherry-pick'
alias gph='git push heroku'
alias gr='cd $(git rev-parse --show-cdup)'

# SVN URIs
SVN=svn+ssh://mojo2/data/svn/dev
SVNROOT=svn+ssh://mojo2/data/svn/dev/associatedcontent.com
BRANCH=svn+ssh://mojo2/data/svn/dev/associatedcontent.com/branches
TAGS=svn+ssh://mojo2/data/svn/dev/associatedcontent.com/tags
TRUNK=svn+ssh://mojo2/data/svn/dev/associatedcontent.com/trunk

# save a lot of history
HISTFILESIZE=1000000
HISTSIZE=10000

# gpg key
export GPGKEY=489265C3

#====================================
# Alan's profile pusher

# Timestamp to check against for updating remote hosts
#profilepush:SERIAL:1299603454

# Add additional files with #profilepush:FILE:<filename>
#profilepush:FILE:.bash_profile
#profilepush:FILE:.bashrc
#profilepush:FILE:.colors
#profilepush:FILE:.vimrc
#profilepush:FILE:.my.cnf
#profilepush:FILE:bin/git-completion.sh
#profilepush:FILE:bin/git-helper.sh

# Sync Function
profilepush () {

myHost=$1

# List of remote hosts that are checked to prevent rsyncing every login
PUSH_HOME_HOSTS="$HOME/.home_version_hosts"

remoteVersion=0
localVersion=`grep "^#profilepush:SERIAL:" ~/.bashrc | awk 'BEGIN{FS=":"}{print $3}'`

if [ -d $PUSH_HOME_HOSTS/$myHost ]
then
if [ -f $PUSH_HOME_HOSTS/$myHost ]
then
remoteVersion=`cat $PUSH_HOME_HOSTS/$myHost`
fi
else
mkdir $PUSH_HOME_HOSTS
fi

if [ $remoteVersion -lt $localVersion ]
then
myFiles=`grep "^#profilepush:FILE:" ~/.bashrc | awk 'BEGIN{FS=":"}{print $3}'`
( cd ; echo "$myFiles" | rsync -av --include-from=- --exclude=* . $myHost: )  && echo "$localVersion" > $PUSH_HOME_HOSTS/$myHost
fi

ssh $myHost
}

#====================================

# vim:ts=4:sw=4

source ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

##
# Your previous /Users/mikescar/.bash_profile file was backed up as /Users/mikescar/.bash_profile.macports-saved_2012-05-23_at_09:39:15
##

# MacPorts Installer addition on 2012-05-23_at_09:39:15: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


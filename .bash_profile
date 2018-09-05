export EDITOR=/usr/bin/vim

. ~/bin/colors.sh
. ~/bin/aliases.sh
. ~/bin/git*sh
. ~/bin/preferences.sh

PATH=$HOME/bin:/usr/local/sbin:$PATH:`yarn global bin`

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

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

# save a lot of history
HISTFILESIZE=1000000
HISTSIZE=10000

function did() {
  $(docker ps | grep $1 | cut -d' ' -f1)
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export GPG_TTY=$(tty)

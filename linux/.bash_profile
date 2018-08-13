export EDITOR=/usr/bin/vim

# Make these available to all logged-in users
. $PREFERENCES_DIR/colors.sh
. $PREFERENCES_DIR/aliases.sh

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# save a lot of history
export HISTFILESIZE=1000000
export HISTSIZE=10000

export GPG_TTY=$(tty)

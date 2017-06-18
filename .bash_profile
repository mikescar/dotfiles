# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
export EDITOR=/usr/bin/vim

. ~/bin/work.sh
. ~/bin/.colors
. ~/bin/git-completion.sh
. ~/bin/git-helper.sh

PATH=$HOME/bin:$PATH:`yarn global bin`

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


alias h='heroku'
alias hl='heroku logs -t'
alias hp='heroku pg:psql -a'
alias hr='heroku releases'
alias hrr='heroku run rails c --size=Performance-M'
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
alias vit='vi ~/.bash_profile'
alias uname='uname -a'
alias vi='/usr/bin/vim'
alias tarz='tar zxvpf'
alias memrestart="mstop && mstart"
alias rdm="rake db:migrate && rake db:migrate RAILS_ENV=test"
alias migra="rake db:migrate && rake db:migrate RAILS_ENV=test"
alias npmstart='npm run defuck; npm run develop'

# git helper bash functions and aliases
alias s='git status '
alias ga='git add '
alias gb='git branch '
alias gba='git branch -a'
alias gd='git diff -p --stat'
alias gds='git diff -p --stat --staged'
alias gg='git grep -n'
alias ggi='git grep -in'
alias gl='git lg'
alias gll='git lc | grep -vi "merge"'
alias gp='git pull'
alias gcp='git cherry-pick'
alias gpu='git push'
alias gput='git push --tags'
alias gpus='git push stage develop:master'
alias gr='cd $(git rev-parse --show-cdup)'
alias gcd='git co develop'
alias gcm='git co master'
alias sr='time spring rspec'
alias srf='time spring rspec --only-failures'
alias ssa='ssh-add ~/.ssh/id_rsa'
alias hpr='hub pull-request'
alias prunelocal='git branch | grep -v develop | grep -v master | xargs git branch -D'

# save a lot of history
HISTFILESIZE=1000000
HISTSIZE=10000

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

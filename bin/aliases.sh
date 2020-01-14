# General aliases

alias gc='gcloud'
alias kc='kubectl'

alias gpgexport='gpg --armor --export'

alias di='docker images'
alias dip='docker image prune -f '
alias drma='docker rm $(docker ps -a -q)'
alias dsa='docker stop $(docker ps -a -q)'
alias drmi='docker rmi'

alias npx='PATH=$(npm bin):$PATH'

alias py='python'

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
alias migrasafe="rake db:migrate && rake db:migrate RAILS_ENV=test && git co db"
alias npmstart='npm run defuck; npm run develop'

alias rc='rubocop'
alias rca='rubocop -a --only'

# git
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
alias gp='git pull --prune'
alias gcp='git cherry-pick'
alias gpu='git push'
alias gput='git push --tags'
alias gpub='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gpus='git push stage develop:master'
alias gr='cd $(git rev-parse --show-cdup)'
alias gcd='git co develop'
alias gcm='git co master'
alias sr='time spring rspec'
alias srf='time spring rspec --only-failures'
alias ssa='ssh-add ~/.ssh/id_rsa'
alias hpr='hub pull-request'
alias ci='hub ci-status'
alias prunelocal='git branch | grep -v develop | grep -v master | xargs git branch -D'

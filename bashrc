#export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;32m\]\[\033[01;34m\] \$\[\033[34m\] '

# Prompt
# show working directory (green bold), git branch (yellow bold) 
export PS1="\[\033[01;32m\]\w\[\033[01;32m\]\[\033[01;34m\]\[\033[01;33m\]\$(parse_git_branch)\[\033[01;33m\] \[\033[34m\]\$\[\033[01;0m\] "

export PAGER='less'
export EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=C

# Specify colors for ls; overwrite default dir with Bold (`E`)
export LSCOLORS="Exfxcxdxbxegedabagacad"

export PATH="$PATH:$HOME/Applications"

### History ###
###############
HISTSIZE=5000
HISTFILESIZE=10000
HISTFILE=$HOME/.bash_history

### Alias ###
#############
alias man='LC_ALL=C LANG=C man'
alias mkdir='mkdir -pv'
alias ll='ls -laghFG'
alias ls='ls -GF'
alias more='less'
alias cdw='cd ~/Documents/work/'
alias sshp='ssh-add ~/.ssh/id_rsa'
alias be='bundle exec'
alias gfiles='git diff-tree --no-commit-id --name-only -r'
alias prod='tabc prod'
alias stage='tabc stage'
alias d='tabc'

source ~/git-completion.bash

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/oranchirapuntu/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

### Functions ###
#################

# Calculate the current git branch (if exists)
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Updates the iTerm2 profile. 
# prod should have a red background
# stage should have a green background
# d(ev) should have a black gbackground
tabc() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi # if you have trouble with this, change
                                                      # "Default" to the name of your default theme
  echo -e "\033]50;SetProfile=$NAME\a"
}

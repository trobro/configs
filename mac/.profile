export LC_ALL="en_US.UTF-8"
export GOPATH=~/go

alias vi=/usr/local/bin/vim
alias vim=/usr/local/bin/vim

alias grep='LC_ALL=C grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls -G'
alias ll='ls -alFhG'
#export PS1="\h:\w$ "
export PS1="\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

gr() { grep "$1" . -RIn --exclude-dir={.git,.svn,bower_components,node_modules,Godeps,i18n,assembled}

pidpath() { lsof -p $1 -Fn | awk 'NR==2{print}' | sed "s/n\//\//"; }

export EDITOR=vim

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# The next line updates PATH for the Google Cloud SDK.
source '/Users/trobro/Applications/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/trobro/Applications/google-cloud-sdk/completion.bash.inc'


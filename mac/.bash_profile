export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export GOPATH=~/go

alias grep='LC_ALL=C grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls -G'
alias ll='ls -alFhG'
#export PS1="\h:\w$ "
export PS1="\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

eval "$(/opt/homebrew/bin/brew shellenv)"
gr() { grep "$1" . -RIn --exclude-dir={*im*,.git,.svn}; }
export EDITOR=vim
export VISUAL=vim
export TERM=xterm-256color

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# bash-completion@1 for Bash 3
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# bash-completion@2 for Bash 4 and newer
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

if [ -f '~/google-cloud-sdk/path.bash.inc' ]; then
  # The next line updates PATH for the Google Cloud SDK.
  source '~/google-cloud-sdk/path.bash.inc'
fi

if [ -f '~/google-cloud-sdk/completion.bash.inc' ]; then
  # The next line enables shell command completion for gcloud.
  source '~/google-cloud-sdk/completion.bash.inc'
fi

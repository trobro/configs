gr() { grep "$1" . -RIn --exclude-dir={*im*,.git,.svn}; }
export EDITOR=vim
export VISUAL=vim
export TERM=xterm-256color

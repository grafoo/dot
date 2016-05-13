# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias l='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -al --color=auto'
alias lt='ls -thl --color=auto'
alias lr='ls -rhl --color=auto'

which virtualenv2 >/dev/null 2>&1 && alias virtualenv='virtualenv2'

alias emacs='emacs --no-window-system'

PS1='[\u@\h \W]\$ '

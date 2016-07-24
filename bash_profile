[[ -f ~/.profile ]] && . ~/.profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

export HISTCONTROL=ignoreboth

termdev=$(tty)
[[ -z $DISPLAY && $termdev == "/dev/tty1" ]] && exec startx

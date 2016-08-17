[[ -f ~/.profile ]] && . ~/.profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

# don't put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth

termdev=$(tty)
[[ -z $DISPLAY && $termdev == "/dev/tty1" ]] && exec startx

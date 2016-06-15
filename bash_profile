[[ -f ~/.profile ]] && . ~/.profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

termdev=$(tty)
[[ -z $DISPLAY && $termdev == "/dev/tty1" ]] && exec startx

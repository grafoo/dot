#xrdb $HOME/.Xresources
# set layout to german, eliminate deadkeys, remap caps to escape and blow up caps for good
setxkbmap -layout de -variant nodeadkeys -option "caps:escape"
exec startxfce4

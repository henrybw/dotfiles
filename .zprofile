export PATH=$PATH:$HOME/bin
export TERMINAL=/usr/bin/konsole
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

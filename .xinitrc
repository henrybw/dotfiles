if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

xrdb -merge ~/.Xresources &

xset m 1 10 &
xset r rate 250 25 &

~/.screenlayout/setupmonitors.sh
feh --bg-fill ~/aqua10-0_10.1.png
# xflux -z 98112 -k 3400

export TERMINAL=alacritty

exec i3

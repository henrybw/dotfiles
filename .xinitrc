if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

# Load .Xresources.
xrdb -merge ~/.Xresources &

xset m 1 10 &
xset r rate 250 25 &

~/.screenlayout/setupmonitors.sh
feh --bg-scale ~/wall.png
exec i3


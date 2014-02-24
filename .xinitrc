if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

~/.screenlayout/setupmonitors.sh
feh --bg-scale ~/wall.png
exec i3


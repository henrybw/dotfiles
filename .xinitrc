if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

feh --bg-scale ~/wall.png
exec i3


if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

# Load .Xresources.
xrdb -merge ~/.Xresources &

xset m 1 10 &
xset r rate 250 25 &

~/.screenlayout/setupmonitorsportrait.sh
feh --bg-fill ~/Lake.jpg --bg-fill ~/Sky.jpg
xflux -z 98112 -k 4200
compton -b
exec i3

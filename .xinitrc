if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

xrdb -merge ~/.Xresources &

xset m 1 10 &
xset r rate 250 25 &

~/.screenlayout/setupmonitorsportrait.sh
feh --bg-fill ~/Lake.jpg --bg-fill ~/Sky.jpg
xflux -z 98112 -k 4200

# Annoyingly, i3 has a rendering bug where vertically-split translucent windows
# will contain graphical artifacts.
#compton -cCG -b --vsync opengl

exec i3

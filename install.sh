#!/bin/bash
find . -maxdepth 1 -name '*' ! -name '.git' ! -name 'install.sh' ! -name 'bin' ! -name '.' | xargs -I file cp -r file ~/file

if [ ! -e /usr/share/keymaps ]; then
    sudo mkdr /usr/share/keymaps;
fi
cp ./capsremap.map /usr/share/keymaps

if [ ! -e ~/bin ]; then
    mkdir ~/bin;
fi
cp bin/* ~/bin


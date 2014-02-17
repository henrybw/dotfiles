#!/bin/bash
find . -maxdepth 1 -name '*' ! -name '.git' ! -name 'install.sh' ! -name 'bin' ! -name '.' | xargs -I file cp -r file ~/file

if [ ! -e ~/bin ]; then
    mkdir ~/bin;
fi

cp bin/* ~/bin


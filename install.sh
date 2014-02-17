#!/bin/bash
find . -maxdepth 1 -name '*' ! -name '.git' ! -name 'install.sh' ! -name '.' | xargs -I file cp -r file ~/file


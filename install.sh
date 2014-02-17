#!/bin/bash
find . -maxdepth 1 -name '*' ! -name '.git' ! -name 'install.sh' | xargs -I file cp -r file ~


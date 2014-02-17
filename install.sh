#!/bin/bash
sudo cp capsremap.map /usr/share/keymaps/capsremap.map
find . -maxdepth 1 -name '.*' ! -name '.git' | xargs -I file cp -r file ~


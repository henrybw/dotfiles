#!/bin/bash
sudo cp capsremap.map /usr/share/keymaps
find . -maxdepth 1 -name '.*' ! -name '.git' | xargs cp ~


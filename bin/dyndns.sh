#!/bin/bash
dig +short myip.opendns.com @resolver1.opendns.com > /tmp/ip.txt
eval $(ssh-agent)
ssh-add $HOME/.ssh/id_persistscreen
scp /tmp/ip.txt henryb@persistscreen.com:~/ip.txt

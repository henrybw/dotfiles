#!/bin/bash
dig +short myip.opendns.com @resolver1.opendns.com > /tmp/ip.txt
ssh-add /home/hbw/.ssh/id_rsa-azure
scp /tmp/ip.txt azureuser@a1ring.cloudapp.net:~/ip.txt

#!/bin/bash
sudo apt install figlet
clear
figlet DEVOPS
echo
echo -n "masukkan domain untuk config ansible (free): ";
read host1;
echo -n "masukkan IP dest-host: ";
read ip1;
echo -n "masukkan user dest-host: ";
read user1;

echo
clear
figlet DEVOPS
tee /etc/ansible/hosts<<EOF
 [$host1]
 $ip1     ansible_user=$user1  ansible_ssh_private_key=/root/.ssh/id_rsa
EOF
echo
echo
ssh-copy-id $user1@$ip1
echo
echo


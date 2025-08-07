#!/bin/bash
clear
echo "PROSES INI HANYA DILAKUKAN DI MESIN BASTION. UNTUK INSTALL ANSIBLE DAN DEPENDENSI NYA"
echo
sudo apt install figlet
clear
figlet DEVOPS
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
apt-get update
clear
figlet DEVOPS
sudo apt install -y ansible
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
clear
figlet DEVOPS
echo "ping to ansible host......"
echo
ansible $host1 -m ping
echo
echo "DONE....ANSIBLE BERHASIL DI INSTALL SELANJUTNYA JANGAN LUPA domain dan user disesuaikan di file yml.."
echo


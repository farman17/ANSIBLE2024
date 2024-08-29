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
#apt-get install python3 ansible
clear

#echo -n "masukkan username baru-ansible: ";
#read username;
#adduser $username
#usermod -aG sudo $username

#runuser -l  $username  -c  'sudo ssh-keygen -t rsa'
#runuser -l  $username  -c  'sudo chmod 400 /root/.ssh/id_rsa'

#sudo ssh-keygen -t rsa
#cd /root/.ssh
#sudo chmod 400 id_rsa
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


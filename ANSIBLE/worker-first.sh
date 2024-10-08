#!/bin/bash
clear
echo "UPDATE SYSTEM......."
apt install figlet
clear
figlet DEVOPS
apt-get update
apt install net-tools
clear
echo "install open ssh untuk remote"
apt install openssh-server
echo "Ganti Hostname"
echo -n "masukkan HOSTNAME baru untuk mesin ini: ";
read hostname;
tee /etc/hostname<<EOF
$hostname
EOF

clear

echo -n "masukkan username baru : ";
read username;
adduser $username
usermod -aG sudo $username

runuser -l  $username  -c  'sudo ssh-keygen -t rsa'
runuser -l  $username  -c  'sudo chmod 400 /root/.ssh/id_rsa'

clear
#echo "add keygen to .ssh"
#sudo ssh-keygen -t rsa
#cd /root/.ssh
#sudo chmod 400 id_rsa
echo
echo
figlet DEVOPS
#echo "add NOPASSWORDD to root........"
echo "%sudo  ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "Bienvenue à rejoindre $username dans HOSTNAME $hostname......."
echo
shutdown -r +1
echo

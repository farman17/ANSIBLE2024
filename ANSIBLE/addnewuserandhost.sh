clear

echo -n "masukkan user baru: ";
read username;
adduser $username
usermod -aG sudo $username

runuser -l  $username  -c  'sudo ssh-keygen -t rsa'
runuser -l  $username  -c  'sudo chmod 400 /root/.ssh/id_rsa'

sudo ssh-keygen -t rsa
cd /root/.ssh
sudo chmod 400 id_rsa

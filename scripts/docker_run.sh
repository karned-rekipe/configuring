sudo docker pull docker.io/library/ubuntu:22.04
sudo docker run -d --name node1 ubuntu:22.04 sleep infinity
sudo docker exec -it node1 /bin/bash

apt update
apt install openssh-server
service ssh start
apt install sudo

apt install vim
vim /etc/ssh/sshd_config

    PermitRootLogin no
    PasswordAuthentication no
    PubkeyAuthentication yes
    AuthorizedKeysFile     %h/.ssh/authorized_keys

service ssh restart

cat ~/.ssh/id_rsa.pub

mkdir -p /home/deploy/.ssh
vim authorized_keys

chmod 700 /home/deploy/.ssh
chmod 600 /home/deploy/.ssh/authorized_keys
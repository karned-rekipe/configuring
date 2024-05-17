sudo useradd -m deploy
echo "deploy:yourpassword" | sudo chpasswd
sudo usermod -aG sudo deploy
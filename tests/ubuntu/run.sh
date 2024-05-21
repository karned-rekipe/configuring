sudo docker build -t ubuntu_test .
sudo docker run -d --name node1 ubuntu_test sleep infinity
sudo docker exec -it node1 /bin/bash
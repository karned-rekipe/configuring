sudo docker pull docker.io/library/ubuntu:22.04
sudo docker run -d --name node1 ubuntu:22.04 sleep infinity
sudo docker exec -it node1 /bin/bash


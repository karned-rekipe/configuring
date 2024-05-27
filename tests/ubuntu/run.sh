sudo docker build -t ubuntu_test .
sudo docker run -d --name node1 --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro ubuntu_test sleep infinity
sudo docker exec -it node1 /bin/bash
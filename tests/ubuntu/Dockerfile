FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    unzip \
    vim \
    nano \
    jq \
    net-tools \
    iputils-ping \
    dnsutils \
    iproute2 \
    iperf \
    iperf3 \
    nmap \
    telnet \
    tcpdump \
    netcat \
    openssh-client \
    openssh-server \
    sudo \
    && rm -rf /var/lib/apt/lists/*

COPY ./sshd_config /etc/ssh/sshd_config

RUN service ssh start

RUN useradd -m -s /bin/bash deploy && \
    echo "deploy:password" | chpasswd && \
    usermod -aG sudo deploy

RUN mkdir -p /home/deploy/.ssh && \
    chmod 700 /home/deploy/.ssh

COPY ./authorized_keys /home/deploy/.ssh/authorized_keys

RUN chmod 600 /home/deploy/.ssh/authorized_keys && \
    chown -R deploy:deploy /home/deploy/.ssh

EXPOSE 22

COPY ./cmd.sh /cmd.sh
RUN chmod +x /cmd.sh

CMD ["/cmd.sh"]
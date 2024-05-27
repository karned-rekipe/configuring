FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

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
    software-properties-common \
    rsyslog \
    systemd \ 
    systemd-cron

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

RUN sed -i 's/^\($ModLoad imklog\)/#\1/' /etc/rsyslog.conf

RUN rm -f /lib/systemd/system/systemd*udev* \
  && rm -f /lib/systemd/system/getty.target

VOLUME ["/sys/fs/cgroup", "/tmp", "/run"]
CMD ["/lib/systemd/systemd"]
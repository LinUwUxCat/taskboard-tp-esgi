FROM ubuntu:24.04

RUN apt update && apt install -y \
    openssh-server \
    docker.io \
    docker-compose-v2 \
    curl

RUN mkdir /var/run/sshd

# utilisateur de déploiement
RUN useradd -m -s /bin/bash deploy

# dossier ssh
RUN mkdir -p /home/deploy/.ssh && \
    chmod 700 /home/deploy/.ssh

# autoriser login par clé
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
RUN echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
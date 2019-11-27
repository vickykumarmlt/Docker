FROM ubuntu:18.04
ENV NAME Vikram
ENV PASS password
RUN mkdir -p /var/run/sshd
RUN apt-get update
RUN apt-get install -y vim apt-utils openssh-server
RUN useradd -d /home/vikram -g root -G sudo -m -p $(echo "$PASS"| openssl passwd -1 -stdin) $NAME
EXPOSE 22
CMD ["/bin/bash", "-D"]

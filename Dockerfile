FROM ubuntu:18.04
LABEL name="Vikram Kumar"
LABEL EmailId="vickykumarmlt@gmail.com"
ENV NAME Vikram
ENV PASS Password
#RUN pwd > /tmp/2
#WORKDIR /tmp/
#RUN pwd > /tmp/3
#WORKDIR /tmp/app/
#RUN pwd > /tmp/4
COPY ubuntu/ /tmp/ubuntu/
RUN apt-get update && apt-get install -y openssh-server 
RUN useradd -d /home/vikram -g root -G sudo -m -p $(echo "$PASS" |openssl passwd -1 -stdin) $NAME
#USER $NAME
#ADD NodeJs.tar /tmp/
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]

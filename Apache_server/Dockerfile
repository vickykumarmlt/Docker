FROM ubuntu:latest

RUN apt-get update -y 
RUN yes | apt-get install apache2
EXPOSE 80
COPY ./index.html ./var/www/html/
CMD ["apache2ctl", "-D", "FOREGROUND"]
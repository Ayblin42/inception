FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt install vim -y
RUN apt install curl -y

RUN apt install nginx -y

RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /var/run/nginx

RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ayblin.42.fr/UID=ayblin"
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

RUN mv /var/www/html/index.nginx-debian.html /var/www/html/index.html
CMD [ "nginx", "-g", "daemon off;" ]
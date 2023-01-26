FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt install vim -y    
RUN apt install curl -y

RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf    /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/startsql.sh   /startsql.sh
ENTRYPOINT ["bash", "startsql.sh"]
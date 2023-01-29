FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server

COPY conf/mdb.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

COPY conf/startsql.sh /
RUN chmod +x startsql.sh
ENTRYPOINT ["bash", "startsql.sh"]

#RUN apt-get update && apt-get upgrade -y
#
#RUN apt-get install mariadb-server -y
#
#COPY conf/mdb.cnf    /etc/mysql/mariadb.conf.d/50-server.cnf
#COPY conf/startsql.sh   /startsql.sh
#ENTRYPOINT ["bash", "startsql.sh"]
#
#EXPOSE 3306
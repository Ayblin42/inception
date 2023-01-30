FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server
RUN apt-get install mariadb-client -y && apt-get install procps -y && apt-get install gettext -y

COPY conf/mdb.cnf /etc/mysql/mariadb.conf.d//50-server.cnf

EXPOSE 3306

COPY conf/startsql.sh /
COPY conf/sqlCMD.sql /etc/mysql/
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
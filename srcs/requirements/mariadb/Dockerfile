FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client
RUN apt-get install -y procps

#remplacer par notre conf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
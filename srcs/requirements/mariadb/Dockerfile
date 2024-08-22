FROM debian:bullseye

RUN apt-get update \
       && apt-get upgrade -y \
       && apt-get install -y mariadb-server \
        && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

COPY ./tools/init-db.sh /init-db.sh

RUN chmod +x /init-db.sh && \
	rm -f /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

ENTRYPOINT [ "/init-db.sh" ]


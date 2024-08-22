# Utilise Debian Bullseye comme base
FROM debian:bullseye

# Mise à jour des paquets et installation de MariaDB
RUN apt-get update \
       && apt-get upgrade -y \
       && apt-get install -y mariadb-server \
       # Nettoyage des fichiers inutiles
       && rm -rf /var/lib/apt/lists/*

# Création du répertoire mysqld et réglage des permissions
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

# Copie le script d'initialisation
COPY ./tools/init-db.sh /init-db.sh

# Rend le script exécutable et supprime l'ancienne config
RUN chmod +x /init-db.sh && \
    rm -f /etc/mysql/mariadb.conf.d/50-server.cnf

# Expose le port 3306 pour MariaDB
EXPOSE 3306

# Copie la nouvelle config MariaDB
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Lancement du script d'initialisation au démarrage
ENTRYPOINT [ "/init-db.sh" ]

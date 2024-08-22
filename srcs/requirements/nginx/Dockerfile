# Base image Debian Bullseye
FROM debian:bullseye

# Mise à jour des paquets et mise à niveau
RUN apt-get update && apt-get upgrade

# Installation de Nginx et OpenSSL
RUN apt-get install -y nginx openssl

# Expose le port 443 pour HTTPS
EXPOSE 443

# Copie la config Nginx personnalisée
COPY conf/default.conf /etc/nginx/conf.d/default.conf
# Copie le script pour générer le certif
COPY ./tools/ranki_crt_key_gen.sh /

# Donne les droits d'exécution au script
RUN chmod 777 /ranki_crt_key_gen.sh

# Lance le script à l'entrée
ENTRYPOINT [ "./ranki_crt_key_gen.sh" ]

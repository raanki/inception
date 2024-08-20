FROM debian:bullseye

# mettre à jour les paquets => -y pourrépondre automatique oui si ya des majs
RUN apt-get update -y 
RUN apt-get install -y nginx

# pour modifier directement dans le container ensuite
RUN apt-get install -y vim
RUN apt-get install -y curl

# tsl
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install -y openssl

# req => certificat format PKCS#10
# -x509 => type du certificat
# -nodes => sans mdp
# out => stocker le certificat
# -keyout => stocker la clef ssl
# -subj => préremplir certaine info necessaire
            # C=FR : Pays
            # ST=IDF : État ou région
            # L=Paris : Localité
            # O=42 : Organisation
            # OU=42 : Unité d'organisation
            # CN=login.42.fr : Nom commun
            # UID=login : Identifiant
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ranki.42.fr/UID=ranki"

#config du server nginx en mettant notre fichier
RUN mkdir -p /var/run/nginx
COPY ./conf/nginx.conf /etc/nginx/nginx.conf


COPY ./tools/custom-nginx.html /var/www/html/custom-nginx.html

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
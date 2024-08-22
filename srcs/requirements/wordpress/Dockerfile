FROM debian:bullseye

RUN apt-get update && apt-get upgrade && \
    apt-get install -y curl mariadb-client php7.4-fpm php-mysql

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin && \
    ln -sf /usr/local/bin/wp-cli.phar /usr/local/bin/wp-cli

RUN mkdir -p /var/www/html/wordpress /run/php && \
    groupadd -r nginx && useradd -r -g nginx nginx && \
    usermod -G nginx -a nginx && \
    chown -R nginx:nginx /var/www/

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/init-wp.sh /init-wp.sh

RUN chmod +x init-wp.sh

WORKDIR /var/www/html/wordpress

EXPOSE 9000

ENTRYPOINT [ "/init-wp.sh" ]
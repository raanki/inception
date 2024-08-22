FROM debian:bullseye

RUN apt-get update && apt-get upgrade
RUN apt-get install -y nginx openssl

EXPOSE 443

COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./tools/ranki_crt_key_gen.sh /

RUN chmod 777 /ranki_crt_key_gen.sh

ENTRYPOINT [ "./ranki_crt_key_gen.sh" ]

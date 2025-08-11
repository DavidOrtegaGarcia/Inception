FROM debian:12.11

RUN apt-get update && apt-get install -y nginx openssl

COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/get_certificate.sh /usr/local/bin/get_certificate.sh
RUN chmod +x /usr/local/bin/get_certificate.sh

RUN mkdir /var/www/daortega.42.fr
COPY ./conf/index.html /var/www/daortega.42.fr/index.html


ENTRYPOINT ["/usr/local/bin/get_certificate.sh"]
CMD ["nginx", "-g", "daemon off;"]

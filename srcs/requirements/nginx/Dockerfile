FROM debian:11.9

RUN apt-get update && apt-get install -y nginx openssl

COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/get_certificate.sh /tmp/get_certificate.sh
RUN chmod +x /tmp/get_certificate.sh

RUN mkdir /var/www/daortega.42.fr
COPY ./conf/index.html /var/www/daortega.42.fr/index.html


ENTRYPOINT ["/tmp/get_certificate.sh"]
CMD ["nginx", "-g", "daemon off;"]

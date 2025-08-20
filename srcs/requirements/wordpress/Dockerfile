FROM debian:12.11

RUN apt-get update && apt-get install -y php8.2-fpm php8.2-mysql curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY ./tools/initWP.sh /usr/local/bin/initWP.sh
RUN chmod +x /usr/local/bin/initWP.sh

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/initWP.sh"]

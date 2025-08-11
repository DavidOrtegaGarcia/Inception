FROM debian:12.11

RUN apt-get update && apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/initDB.sh /usr/local/bin/initDB.sh
RUN chmod +x /usr/local/bin/initDB.sh

ENTRYPOINT ["/usr/local/bin/initDB.sh"]


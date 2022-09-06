FROM debian:buster

RUN apt-get update \
    && apt-get upgrade 

RUN apt-get install -y mariadb-server gettext-base
RUN mkdir -p /var/lib mysqld /run/mysqld

COPY ./tools/creat_db_.sql /tmp/create_db.sql 
COPY ./tools/entrypoint.sh ./

RUN chmod +x ./entryoint.sh

COPY ./tools/mariadb-server.cnf /etc/my.cnf.d/

RUN mariadb-install-db --datadir=/var/lib/mysql \
        --auth-root-authentification-method=normal

RUN chown -R mysql:mysql /var/lib/mysql \
    chown -R mysql:mysql /run/mysqld

ENTRYPOINT [ "sh", "entrypoint.sh" ]
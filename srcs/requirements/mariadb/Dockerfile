FROM alpine:3.14

# Update packet manager
RUN	apk update

# Install mariadb and mariadb-client
RUN	apk add --no-cache --quiet --update mariadb mariadb-client vim

RUN mkdir -p /var/lib mysqld /run/mysqld

COPY ./tools/create_db.sql /tmp/create_db.sql 
COPY ./tools/entrypoint.sh ./

RUN chmod +x ./entrypoint.sh

COPY ./tools/mariadb-server.cnf /etc/my.cnf.d/

RUN mariadb-install-db --datadir=/var/lib/mysql \
        --auth-root-authentication-method=normal

RUN chown -R mysql:mysql /var/lib/mysql \
    chown -R mysql:mysql /run/mysqld

ENTRYPOINT [ "sh", "entrypoint.sh" ]
FROM	alpine:3.14

# Update packet manager
RUN		apk update

RUN		apk add --no-cache --quiet --update curl bash vim
RUN		apk add --no-cache --quiet --update mariadb-client
RUN		apk add --no-cache --quiet --update php7 php-phar \
			php-json php-curl php-fpm php-mysqli php-iconv
#Creating a WP directory
RUN mkdir -p /var/www/wordpress

# Download wordpress and add execution rights to the wp cli command
RUN		curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
			--output /usr/bin/wp 
RUN		chmod +x ./usr/bin/wp 
RUN		wp core download --path=/var/www/wordpress

WORKDIR /var/www/wordpress

# Copy the configuration files for php
COPY ./tools/php.ini /etc/php/7.3/fpm 
COPY ./tools/php-fpm.conf /etc/php/7.3/fpm 
COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d/

# Copy config file
COPY	tools/wp-config.php /config/wp-config.php

# Copy entrypoint script and add execution rights
COPY	./scripts/entrypoint.sh /tmp/entrypoint.sh
RUN		chmod +x /tmp/entrypoint.sh

# Execute script with entrypoint to make sure it's never ignored
ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]


# EXPOSE 9000

# RUN mkdir -p /run/php

# CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
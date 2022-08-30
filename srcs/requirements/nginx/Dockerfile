FROM debian:buster

#update packet manager, install nginx & openssl + upgrade them
RUN apt-get update \
    && apt-get upgrade 

RUN apt-get install -y nginx 

RUN apt-get install -y openssl 

COPY ./tools/nginx.conf /etc/nginx/

RUN mkdir -p /etc/nginx/ssl \
    && mkdir -p /etc/nginx/sites-enabled/

#COPY tools/wordpress.conf /etc/nginx/sites-enabled/

RUN openssl req -x509 -nodes \
    -days 30 -subj "/C=BE/ST=Belgium/L=Brussels/o=42Network/OU=s19/CN=maelle" \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx-selfsigned.key \
    -out /etc/nginx/ssl/nginx-selfsigned.crt;

RUN echo "<?php phpinfo(); ?>" >> /var/www/html/info.php
#expose port 443 to communicate with the browser
EXPOSE 443

#Keep running nginx in the forground, for inactive container would stop
CMD ["nginx", "-g", "daemon off;"]
#CMD nginx -g "daemon off;" 

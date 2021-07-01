FROM alpine:3.12
#install nginx
RUN apk update && apk upgrade && apk add nginx php7-common php7-fpm && \
apk add php7-session php7-iconv php7-json php7-gd php7-curl php7-xml && \
apk add php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql && \
apk add php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext && \
apk add php7-ldap php7-ctype php7-dom supervisor openssl
COPY ./src/localhost.conf ./etc/nginx/conf.d/default.conf
COPY ./src/supervisor.conf ./etc/supervisor.conf
RUN mkdir ./run/nginx/
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.crt -keyout /etc/nginx/ssl/localhost.key -subj "/C=RU/ST=Tatarstan/L=Kzn/O=School21/OU=Student/CN=Jjerrod"
#install phpmyadmin
WORKDIR ./usr/share/webapps/phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz
RUN tar xvf phpMyAdmin-5.1.0-english.tar.gz --strip-components 1
RUN rm phpMyAdmin-5.1.0-english.tar.gz
WORKDIR ./../../../../
RUN mkdir ./run/php/
RUN chmod -R 777 ./usr/share/webapps/phpmyadmin
COPY ./src/config.inc.php ./usr/share/webapps/phpmyadmin/config.inc.php
RUN ln -s ./usr/share/webapps/phpmyadmin/ ./var/www/localhost/htdocs/phpmyadmin
COPY ./src/phpmyadmin_start.sh ./phpmyadmin_start.sh
RUN chmod +x ./phpmyadmin_start.sh
EXPOSE 5000
ENTRYPOINT ["sh", "phpmyadmin_start.sh"]
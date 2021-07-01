FROM alpine:3.12
#install nginx
RUN apk update && apk upgrade && apk add nginx php7-common php7-fpm && \
apk add php7-session php7-iconv php7-json php7-gd php7-curl php7-xml && \
apk add php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql && \
apk add php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext && \
apk add php7-ldap php7-ctype php7-dom php-phar curl supervisor openssl
COPY ./src/localhost.conf ./etc/nginx/conf.d/default.conf
RUN mkdir ./run/nginx/
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.crt -keyout /etc/nginx/ssl/localhost.key -subj "/C=RU/ST=Tatarstan/L=Kzn/O=School21/OU=Student/CN=Jjerrod"
#install wordpress
WORKDIR ./usr/share/webapps/
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
RUN chown -R 777 /usr/share/webapps/
RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
WORKDIR ./../../../
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./src/wp-config.php ./usr/share/webapps/wordpress/wp-config.php
COPY ./src/supervisor.conf ./etc/supervisor.conf
COPY ./src/wordpress_start.sh ./wordpress_start.sh
RUN chmod +x ./wordpress_start.sh
EXPOSE 5050
ENTRYPOINT ["sh", "./wordpress_start.sh"]
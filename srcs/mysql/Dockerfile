FROM alpine:3.12.3
RUN apk update && apk upgrade && apk add openrc supervisor mysql mysql-client
COPY ./src/start.sh .
COPY ./src/create_db .
RUN chmod +x start.sh
COPY ./src/my.cnf /etc/mysql
COPY ./src/supervisor.conf ./etc/supervisor.conf
VOLUME ["/var/lib/mysql"]
EXPOSE 3306
ENTRYPOINT ["sh", "./start.sh"]
FROM alpine:3.12
RUN apk update && apk upgrade && apk add nginx && apk add openssl
COPY ./src/localhost.conf ./etc/nginx/conf.d/default.conf
RUN mkdir /etc/nginx/ssl
RUN mkdir /run/nginx/
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.crt -keyout /etc/nginx/ssl/localhost.key -subj "/C=RU/ST=Tatarstan/L=Kzn/O=School21/OU=Student/CN=Jjerrod"
EXPOSE 80 443
ENTRYPOINT ["nginx", "-g", "daemon off;"]
FROM alpine:3.12
RUN apk update && apk upgrade && apk add vsftpd openssl
RUN adduser -D jjerrod && echo "jjerrod:12345" | chpasswd
RUN chmod -R 777 ./home/jjerrod
RUN chown jjerrod ./home/jjerrod
RUN chmod -R 777 ./etc/vsftpd
COPY ./src/vsftpd.conf ./etc/vsftpd/vsftpd.conf
COPY ./src/vsftpd.user_list ./etc/vsftpd/vsftpd.user_list
RUN mkdir ./etc/vsftpd/ssl/
RUN openssl req -newkey rsa:2048 -x509 -days 365 -nodes -out ./etc/ssl/certs/vsftpd.pem -keyout ./etc/ssl/private/vsftpd.key -subj "/C=RU/ST=Tatarstan/L=Kzn/O=School21/OU=Student/CN=Jjerrod"
COPY ./src/ftps_start.sh ./ftps_start.sh
RUN chmod -R +x ./ftps_start.sh
COPY ./src/file_for_upload.txt ./home/jjerrod/file_for_upload.txt
EXPOSE 21 2142
ENTRYPOINT ["sh", "./ftps_start.sh"]
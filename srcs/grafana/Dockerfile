FROM alpine:3.12
RUN apk update && apk upgrade && apk add libc6-compat
WORKDIR ./etc/grafana/.
RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.2.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-7.5.2.linux-amd64.tar.gz --strip-components 1
RUN rm grafana-enterprise-7.5.2.linux-amd64.tar.gz
WORKDIR ./../../
COPY ./src/grafana.db /etc/grafana/data/
WORKDIR /etc/grafana/bin
EXPOSE 3000
ENTRYPOINT ["./grafana-server"]
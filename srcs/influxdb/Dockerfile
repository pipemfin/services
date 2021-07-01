FROM alpine:3.12
RUN apk update && apk upgrade && apk add influxdb supervisor && apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community
#install influxdb
RUN mkdir -p ./etc/influxdb/
COPY ./src/influxdb.conf ./etc/influxdb/influxdb.conf
COPY ./src/supervisor.conf ./etc/supervisor.conf
RUN mkdir -p ./var/lib/influxdb/meta
RUN mkdir ./var/lib/influxdb/data
RUN mkdir ./var/lib/influxdb/wal
RUN chown influxdb:influxdb ./etc/influxdb
#install telegraf
RUN mkdir ./etc/telegraf
RUN chown telegraf:telegraf ./etc/telegraf
RUN telegraf -sample-config --input-filter docker --output-filter influxdb > ./etc/telegraf/telegraf.conf
COPY ./src/supervisor.conf ./etc/supervisor.conf
EXPOSE 8086
VOLUME ["/var/lib/influxdb"]
ENTRYPOINT ["supervisord", "-c", "./etc/supervisor.conf"]
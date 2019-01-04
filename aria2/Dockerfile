FROM alpine:3.8

MAINTAINER g@phpgao.com

RUN apk update && \
        apk add aria2 && \
        rm -r /var/cache/ &&\
        mkdir /etc/aria2 /mnt/media &&\
        touch /etc/aria2/aria2.session

COPY aria2.conf /etc/aria2/aria2.conf

VOLUME /mnt/media

EXPOSE 6800

CMD set -xe && \
        /usr/bin/aria2c --conf-path=/etc/aria2/aria2.conf

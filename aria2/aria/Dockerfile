FROM alpine:3.10

LABEL maintainer="g@phpgao.com"

RUN apk add --no-cache aria2

COPY done.sh done.sh
COPY aria2.conf /etc/aria2/aria2.conf

EXPOSE 6800

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["sh", "/docker-entrypoint.sh"]

FROM alpine:3

LABEL maintainer="g@phpgao.com"

RUN apk update && \
        apk add aria2 nginx && \
        apk add --no-cache --virtual .build-deps  curl jq && \
        mkdir -p /etc/aria2 /mnt/media && \
        v=`curl --silent "https://api.github.com/repos/mayswind/AriaNg/releases/latest" | jq -r .tag_name` && \
        mkdir /var/lib/html && \
        curl -sSL https://github.com/mayswind/AriaNg/releases/download/$v/AriaNg-$v.zip -o /aria2.zip && \
        unzip -q /aria2.zip -d /var/lib/html  && \
        rm /aria2.zip && \
        apk del .build-deps && \
        rm -rf /etc/nginx/conf.d/default.conf && \
        rm -rf /tmp/* && \
        rm -r /var/cache/

COPY done.sh /done.sh
COPY delete.sh /delete.sh
COPY aria2.conf /etc/aria2/aria2.conf
COPY nginx.conf /etc/nginx/
ADD conf.d /etc/nginx/conf.d

RUN chmod a+x /done.sh /delete.sh

VOLUME /mnt/media

EXPOSE 80 6800
COPY docker-entrypoint.sh /docker-entrypoint.sh
#CMD ["sh","-c","/usr/bin/aria2c --conf-path=/etc/aria2/aria2.conf -D && /usr/sbin/nginx"]
ENTRYPOINT ["sh", "/docker-entrypoint.sh"]
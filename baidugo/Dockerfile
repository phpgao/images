FROM alpine:3.10

LABEL maintainer="endoffight@gmail.com"

LABEL keyword="baidupcs baidupcs-web apline"

RUN apk add curl jq tzdata --no-cache && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    version=`curl --silent "https://api.github.com/repos/liuzhuoling2011/baidupcs-web/releases/latest"|jq -r '.tag_name'` && \
    curl -sSL https://github.com/liuzhuoling2011/baidupcs-web/releases/download/$version/BaiduPCS-Go-$version-linux-amd64.zip|unzip -d /tmp - && \
    mv /tmp/BaiduPCS-Go-$version-linux-amd64/BaiduPCS-Go /usr/local/bin/BaiduPCS-Go && \
    chmod a+x /usr/local/bin/BaiduPCS-Go && \
    apk del curl jq tzdata  && \
    rm -rf /tmp/BaiduPCS-Go-$version-linux-amd64

EXPOSE 5299

CMD ["BaiduPCS-Go"]
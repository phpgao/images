FROM alpine:3.10

LABEL maintainer="endoffight@gmail.com"

LABEL keyword="frp frpc frps apline"

RUN apk add curl jq tzdata --no-cache && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    version=`curl --silent "https://api.github.com/repos/fatedier/frp/releases/latest"|jq -r '.tag_name'` && \
    v=`echo $version | sed 's/v//g'` && \
    curl -sSL https://github.com/fatedier/frp/releases/download/$version/frp_"$v"_linux_amd64.tar.gz|tar zx frp_"$v"_linux_amd64/frps frp_"$v"_linux_amd64/frps.ini -C /tmp/ && \
    mv /tmp/frp_"$v"_linux_amd64/frps /usr/local/bin/frps && \
    mkdir /etc/frps && \
    mv /tmp/frp_"$v"_linux_amd64/frps.ini /etc/frps/frps.ini && \
    apk del curl jq tzdata && \
    rm -rf /tmp/frp_"$v"_linux_amd64

CMD ["frps", "-c", "/etc/frps/frps.ini"]
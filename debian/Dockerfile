FROM debian:jessie

LABEL maintainer="g@phpgao.com"

# mirror
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list && \
    apt-get update -qq &&\
    apt-get -qqy upgrade &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -qqy --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    wget \
    git \
    python \
    apt-utils \
    dialog \
    debconf-utils \
    tzdata \
    unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    echo "Asia/Shanghai" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    echo 'alias ll="ls -lah --color=auto"' >> /etc/bash.bashrc && \
    wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py && rm get-pip.py

CMD ["bash"]
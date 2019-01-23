FROM ubuntu:zesty

LABEL maintainer="g@phpgao.com"

#RUN sed -i "s/archive\.ubuntu\.com/mirrors\.163\.com/g" /etc/apt/sources.list
#RUN sed -i "s/archive\.ubuntu\.com/mirrors\.aliyun\.com/g" /etc/apt/sources.list
#RUN sed -i "s/archive\.ubuntu\.com/tw\.archive\.ubuntu\.com/g" /etc/apt/sources.list
#RUN sed -i "s/archive\.ubuntu\.com/cn\.archive\.ubuntu\.com/g" /etc/apt/sources.list

# timezone
RUN echo 'Asia/Shanghai' > /etc/timezone && \
        sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
        apt-get update -qq && \
        apt-get -qqy upgrade && \
        DEBIAN_FRONTEND=noninteractive apt-get install -qqy --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        wget \
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
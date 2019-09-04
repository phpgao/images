###############################################################################
# Name:         Dockerfile
# Author:       Daniel Middleton <daniel-middleton.com>
# Description:  Dockerfile used to build dannydirect/tinyproxy
# Usage:        docker build -t dannydirect/tinyproxy:latest .
###############################################################################

FROM alpine:3.10

COPY run.sh /opt/docker-tinyproxy/run.sh


RUN apk add --no-cache \
	bash \
	tinyproxy && \
	chmod a+x /opt/docker-tinyproxy/run.sh

ENTRYPOINT ["/opt/docker-tinyproxy/run.sh"]

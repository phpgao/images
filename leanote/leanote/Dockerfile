FROM golang:1.12.9-alpine3.10 as s1

LABEL maintainer "g@phpgao.com"
LABEL keyword "alpine leanote golang"

RUN apk add --no-cache git && \
    go get -u -v github.com/golang/dep/cmd/dep

FROM golang:1.12.9-alpine3.10

COPY --from=s1 /go/bin/dep /go/bin/dep

RUN apk add --no-cache git && \
    go get -u -v github.com/leanote/leanote/app && \
    go get -u -v github.com/revel/cmd/revel && \
    apk del git && \
    rm -r /go/src/github.com/leanote/leanote/mongodb_backup

EXPOSE 80

CMD ["revel","run","/go/src/github.com/leanote/leanote"]
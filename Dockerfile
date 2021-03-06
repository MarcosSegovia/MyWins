FROM alpine:latest
MAINTAINER Marcos Segovia <velozmarkdrea@gmail.com>

ENV GOPATH /go

ENV app_env prod
ENV DB_DBNAME mywins
ENV DB_WINS_COLLECTION wins
ENV DB_FAILS_COLLECTION fails

COPY . /go/src/github.com/marcossegovia/MyWins

RUN apk add --update git go make musl-dev &&\
    go get github.com/Masterminds/glide &&\
    cd /go/src/github.com/Masterminds/glide &&\
    make install &&\
    cd /go/src/github.com/marcossegovia/MyWins &&\
    glide install &&\
    cd /go/src/github.com/marcossegovia/MyWins/src &&\
    go build -o /mywins *.go &&\
    mv /go/src/github.com/marcossegovia/MyWins/files /files &&\
    apk del go git &&\
    rm -rf /go

EXPOSE 8080
EXPOSE 8081
CMD ["/mywins"]

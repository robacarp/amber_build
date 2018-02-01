FROM ysbaddaden/crystal-alpine:latest

RUN apk add --update nodejs
RUN apk add nodejs-npm
RUN apk add readline-dev
RUN apk add git
RUN apk add curl
RUN apk add mariadb-dev
RUN apk add sqlite-dev
RUN apk add postgresql-dev
RUN apk add yaml-dev


WORKDIR /amber
COPY shard.yml /amber/shard.yml
RUN crystal deps
# RUN shards build amber
# RUN ln -s /amber/bin/amber /usr/local/bin

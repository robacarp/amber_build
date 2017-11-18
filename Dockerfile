FROM crystallang/crystal:0.23.1

ARG DEBIAN_FRONTEND=noninteractive
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update -qq && apt-get install -y --no-install-recommends libpq-dev libsqlite3-dev libmysqlclient-dev libreadline-dev git curl nodejs

WORKDIR /amber
RUN echo '\
name: amber_binary \n\
version: 0.0.1 \n\
crystal: 0.23.1 \n\
 \n\
targets: \n\
  amber: \n\
    main: lib/amber/src/amber/cli.cr \n\
 \n\
dependencies: \n\
  amber: \n\
    github: amberframework/amber \n\
    \n\
' >> /amber/shard.yml
RUN shards build amber

[![](https://dockeri.co/image/robacarp/amber_build)](https://hub.docker.com/r/robacarp/amber_build/)

Use this docker image as a base image for an Amber app deployment. It comes pre-installed with Crystal, Nodejs & NPM, and Amber.

```dockerfile
FROM robacarp/amber:latest

ENV AMBER_ENV production
EXPOSE 3000

COPY config /app/config
COPY db /app/db
COPY public /app/public
COPY src /app/src

COPY package.json /app

COPY shard.yml /app
COPY shard.lock /app

WORKDIR /app
RUN shards install
RUN npm install
RUN npm run release

# change this to the name of your app
RUN shards build my_app --production

# change this to a valid url for your database
ENV DATABASE_URL postgres://my_app:@docker.for.mac.localhost:5432/my_app_development

ENTRYPOINT ["/bin/sh","-c"]

# change this to the name of your app
CMD ["/app/bin/my_app"]
```

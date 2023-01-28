FROM node:latest

RUN mkdir -p /app
WORKDIR /app

# just copy in package.json so caching works right
COPY package.json .
COPY package-lock.json .

RUN npm install

COPY ./ .

# inject dataset that into Elasticsearch
RUN node server/insertToElasticSearch.js

ENTRYPOINT node server/index.js

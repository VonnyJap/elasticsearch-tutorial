# Elasticsearch Tutorial
The project is sort of a bare metal fullstack application, that can help you get started with Elasticsearch.

## Setup
To run the application you need to have Elasticsearch installed locally, you can do that by
```
docker network create elastic

docker pull docker.elastic.co/elasticsearch/elasticsearch:7.15.2

docker run --name es01-test --net elastic -p 127.0.0.1:9200:9200 -p 127.0.0.1:9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.15.2
```

To run Kibana, follow the instructions below
```
docker pull docker.elastic.co/kibana/kibana:7.15.2

docker run --name kib01-test --net elastic -p 127.0.0.1:5601:5601 -e "ELASTICSEARCH_HOSTS=http://es01-test:9200" docker.elastic.co/kibana/kibana:7.15.2
```

Then you can install the project dependencies by running
```
docker build -f Dockerfile -t elasticnodeapp

docker run -d -p 127.0.0.1:3030:3030 -v $(pwd)/.:/tmp/app --name node01-test --net elastic -e "ELASTICSEARCH_HOSTS=http://es01-test:9200" elasticnodeapp

```
For testing node app purpose 
```
docker run -d -v $(pwd):/tmp/app/ --name node01-test --net elastic node tail -f /dev/null
```

Build the UI
- Need to create elasticsearch app using react-app scripts and then make sure to connect to the API host

## Note on ES
- Indexes in elastic search are containers for documents, in our case, the zips index is a container for zip documents. In analogous terms, you can compare an Elasticsearch index to a table in SQL-based databases or a Collection in No-SQL Databases.

## Links
- If you want to know more about Elasticsearch and this project you can head over to my [article](https://medium.com/@StandupCoder/your-first-elasticsearch-application-7db5ea74ef02)
- Another [article](https://betterprogramming.pub/your-first-elasticsearch-application-7db5ea74ef02)

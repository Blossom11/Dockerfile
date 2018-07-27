#!/bin/bash
docker run \
	-d \
	--network solr \
	--name kibana\
	-e ELASTICSEARCH_URL=http://172.19.0.3:9200 \
	-p 5601:5601 \
	kibana:5.6.9;

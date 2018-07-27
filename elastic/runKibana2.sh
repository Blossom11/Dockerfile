#!/bin/bash
docker run \
	-d \
	--name kibana2\
	--network solr \
	-e ELASTICSEARCH_URL=http://172.19.0.2:9200 \
	-p 5602:5601 \
	kibana:5.6.9;

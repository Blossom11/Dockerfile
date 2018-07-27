#!/bin/bash
docker run \
	-d \
	--name elas1 \
	--network solr \
	-p 9200:9200 \
	elasticsearch:5.6.9 \
	-E cluster.name=es-1 \
	-E node.name='node-1'\
	-E network.host=0.0.0.0 \
	-E discovery.zen.minimum_master_nodes=1 ;
	

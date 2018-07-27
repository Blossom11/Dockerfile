#!/bin/bash
docker run \
	-d \
	--name elas3 \
	--network solr \
	elasticsearch:5.6.9 \
	-E cluster.name='es-1' \
	-E node.name='node-3' \
	-E network.host=0.0.0.0 \
	-E discovery.zen.minimum_master_nodes=1 \
	-E discovery.zen.ping.unicast.hosts=elas1;

#!/bin/bash
docker \
    run \
	-it\
        --detach \
        --name 'pylucene' \
        --network solr \
	-v /home/ja/PycharmProjects/code/Docker:/share \
	-p 8888:8888 \
	-p 4444:22 \
        pylucene2:0.1;

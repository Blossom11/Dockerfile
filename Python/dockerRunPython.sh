#!/bin/bash
docker \
    run\
	-it\
        --detach \
        --name 'python' \
        --network solr \
        --publish 18888:18888 \
	-v /home/ja/PycharmProjects/code/Docker:/code \
        python:3.6;

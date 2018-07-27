#!/bin/bash
docker \
    run\
	-it \
	--name 'conda' \
	--publish 8888:8888 \
	--detach \
	--network solr \
	-v /home/ja/PycharmProjects/code/Docker:/notebooks \
        continuumio/anaconda3;

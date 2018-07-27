#!/bin/bash
nvidia-docker \
    run\
	-d \
	-it \
	--name 'tf1' \
	--network tf \
	-v /home/ja/PycharmProjects/code/Docker:/notebooks \
	-p 8888:8888 \
	ctf:latest;

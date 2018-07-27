#!/bin/bash
nvidia-docker \
    run\
	-d \
	-it\
        --name 'tf3' \
        --network tf \
	-v /home/ja/PycharmProjects/code/Docker:/notebooks \
	ctf:latest;

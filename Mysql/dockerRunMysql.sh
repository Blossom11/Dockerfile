#!/bin/bash
docker \
    run\
        --detach \
        --env MYSQL_ROOT_PASSWORD='1324' \
        --env MYSQL_USER='ja'\
        --env MYSQL_PASSWORD='1324' \
        --env MYSQL_DATABASE='sample_db' \
        --name 'db' \
        --publish 3306:3306 \
	--network solr \
        mysql:5.7;

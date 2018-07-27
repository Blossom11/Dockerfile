docker run -it --rm --network solr -v "$PWD":/config-dir logstash  -f /config-dir/logstash.conf

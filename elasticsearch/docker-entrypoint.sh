#!/bin/bash

set -e

# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- elasticsearch "$@"
fi

# Drop root privileges if we are running elasticsearch
# allow the container to be started with `--user`
if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
	# Change the ownership of user-mutable directories to elasticsearch
	for path in \
		/usr/share/elasticsearch/data \
		/usr/share/elasticsearch/logs \
	; do
		chown -R elasticsearch:elasticsearch "$path"
	done
	
	set -- gosu elasticsearch "$@"
	#exec gosu elasticsearch "$BASH_SOURCE" "$@"
fi

sed "s#KIBANA_RW_USERNAME#$KIBANA_RW_USERNAME#g" -i /usr/share/elasticsearch/config/elasticsearch.yml
sed "s#KIBANA_RW_PASSWORD#$KIBANA_RW_PASSWORD#g" -i /usr/share/elasticsearch/config/elasticsearch.yml

if [ "$KIBANA_RO_USERNAME" ]; then
	sed "s#KIBANA_RO_USERNAME#$KIBANA_RO_USERNAME#g" -i /usr/share/elasticsearch/config/elasticsearch.yml
	sed "s#KIBANA_RO_PASSWORD#$KIBANA_RO_PASSWORD#g" -i /usr/share/elasticsearch/config/elasticsearch.yml
	sed "s#\#-RO-##g" -i /usr/share/elasticsearch/config/elasticsearch.yml
fi

# As argument is not related to elasticsearch,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
#!/bin/bash
set -Eeuo pipefail

cd "$( dirname "${BASH_SOURCE[0]}" )"

# create directory structure and put in config files
mkdir -p /srv/elk
cp -r ./data_initial/* /srv/elk
mkdir -p /srv/elk/elasticsearch/data

# user in docker containers is mapped to UID 1000
chown -R 1000:1000 /srv/elk

docker-compose up --build
# wait 5 minutes for everything to start up

# first run: docker exec -it filebeat filebeat setup

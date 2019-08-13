#!/bin/bash
set -Eeuo pipefail

cd "$( dirname "${BASH_SOURCE[0]}" )"

mkdir -p /srv/elk
cp -r ./data_initial/* /srv/elk
chown -R 1000:1000 /srv/elk
docker-compose up --build

#!/bin/bash
set -e

source ../store/auth/passwords.env
source ../store/nextcloud/passwords.env

envsubst < docker-compose.yml > ../store/nextcloud/docker-compose.yml

echo "Pulling images and recreate containers..."

docker-compose -f ../store/nextcloud/docker-compose.yml -p "$HABIDAT_DOCKER_PREFIX-nextcloud" pull
docker-compose -f ../store/nextcloud/docker-compose.yml -p "$HABIDAT_DOCKER_PREFIX-nextcloud" up -d

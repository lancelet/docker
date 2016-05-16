#!/usr/bin/env bash
set -e
set -u
set -v

docker_image=$1

user=lancelet

docker login \
    -e="$DOCKER_EMAIL" \
    -u="$DOCKER_USERNAME" \
    -p="$DOCKER_PASSWORD"
docker push $user/$docker_image:$DOCKER_IMAGE_VERSION

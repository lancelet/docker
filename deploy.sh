#!/usr/bin/env bash
set -e
set -u
set -v

docker login \
    -e="$DOCKER_EMAIL" \
    -u="$DOCKER_USERNAME" \
    -p="$DOCKER_PASSWORD"
docker push lancelet/centos6-lts-a:$DOCKER_IMAGE_VERSION
docker push lancelet/centos6-lts-b:$DOCKER_IMAGE_VERSION

#!/usr/bin/env bash

# Build a Docker image with a version tag specified in an environment
# variable.
#
# eg.
# DOCKER_IMAGE_VERSION=2 ./docker-build.sh directory

set -e
set -u
set -v

docker_image_dir=$1
user=lancelet

cp ./common-stack/* $docker_image_dir/.

# Try to pull a pre-existing version of the image to avoid re-building
docker pull \
    $user/$docker_image_dir:$DOCKER_IMAGE_VERSION \
    || true  # allow failure

docker \
    build \
    -t $user/$docker_image_dir:$DOCKER_IMAGE_VERSION \
    $docker_image_dir

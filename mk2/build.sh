#!/usr/bin/env bash
set -e

DOCKER_HTTP_PROXY=http://10.0.2.2:3128
DOCKER_HTTPS_PROXY=${DOCKER_HTTP_PROXY}
SOURCE_CERTS_DIR=${HOME}/workspace/certs
CACHE_CERTS_DIR=$./certs

mkdir -p $CACHE_CERTS_DIR
for cert_file in "${SOURCE_CERTS_DIR}/*.pem"
do
    echo "copying $cert_file to $CACHE_CERTS_DIR"
    cp $cert_file $CACHE_CERTS_DIR
done

docker build \
       -t lancelet/mk2 \
       --build-arg DOCKER_HTTP_PROXY=${DOCKER_HTTP_PROXY} \
       --build-arg DOCKER_HTTPS_PROXY=${DOCKER_HTTPS_PROXY} \
       --build-arg CACHE_CERTS_DIR=${CACHE_CERTS_DIR} \
       .

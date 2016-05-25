#!/usr/bin/env bash
set -e
set -x

export DOCKER_HTTP_PROXY="http://10.0.2.2:3128"
export DOCKER_HTTPS_PROXY="${DOCKER_HTTP_PROXY}"

./dockerize dockerize.script

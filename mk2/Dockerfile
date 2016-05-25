# Dockerfile for Stackage LTS on Centos 6
FROM       centos:6
MAINTAINER Jonathan Merritt <j.s.merritt@gmail.com>

## Build arguments
ARG DOCKER_HTTP_PROXY
ARG DOCKER_HTTPS_PROXY
ARG CACHE_CERTS_DIR

## HTTP proxy
ENV HTTP_PROXY $DOCKER_HTTP_PROXY
ENV HTTPS_PROXY $DOCKER_HTTPS_PROXY
ENV http_proxy $HTTP_PROXY
ENV https_proxy $HTTPS_PROXY

## Certificates
RUN update-ca-trust force-enable
ADD $CACHE_CERTS_DIR/*.pem /etc/pki/ca-trust/source/anchors/
RUN update-ca-trust extract

## Basic dependencies
RUN yum install -y git gcc gcc-c++ gmp-devel zlib-devel libstdc++-devel
RUN yum install -y tar rpmdevtools
RUN yum install -y epel-release
RUN yum install -y libgsasl-devel

## Fetch and install stack
ENV FPC_URL https://s3.amazonaws.com/download.fpcomplete.com
RUN curl -sSL $FPC_URL/centos/6/fpco.repo | tee /etc/yum.repos.d/fpco.repo
RUN yum -y install stack

## Haskell environment
# ENV PATH $HOME/.local/bin:$PATH
# ENV STACK_PROJECTDIR /opt/stack
# ENV PACKAGES_TXT $STACK_PROJECTDIR/packages.txt
# ENV STACK_WORKDIR ./.stack-work
# ENV STACK_YAML $STACK_PROJECTDIR/stack.yaml
# ENV STACK_SETUP "stack setup --no-terminal"
# #ENV STACK_INSTALL "stack install --no-terminal --executable-profiling --work-dir $STACK_WORKDIR --stack-yaml $STACK_YAML"

# ## Copy across stack.yaml and packages.txt
# ADD stack.yaml $STACK_YAML
# ADD packages.txt $PACKAGES_TXT

# ## Basic GHC install
# RUN $STACK_SETUP

# Dockerfile for Stackage LTS on Centos 6
FROM       centos:6
MAINTAINER Jonathan Merritt <j.s.merritt@gmail.com>

## HTTP proxy
ENV HTTP_PROXY http://10.0.2.2:3128
ENV HTTPS_PROXY http://10.0.2.2:3128
ENV http_proxy $HTTP_PROXY
ENV https_proxy $HTTPS_PROXY

## Basic dependencies
RUN yum install git gcc gcc-c++ gmp-devel zlib-devel libstdc++-devel -y

## Fetch and install stack
ENV FPC_URL https://s3.amazonaws.com/download.fpcomplete.com
RUN curl -sSL $FPC_URL/centos/6/fpco.repo | tee /etc/yum.repos.d/fpco.repo
RUN yum -y install stack

## Haskell environment
ENV PATH $HOME/.local/bin:$PATH
ENV STACK_PROJECTDIR /opt/stack
ENV PACKAGES_TXT $STACK_PROJECTDIR/packages.txt
ENV STACK_WORKDIR ./.stack-work
ENV STACK_YAML $STACK_PROJECTDIR/stack.yaml
ENV STACK_SETUP "stack setup --no-terminal"
#ENV STACK_INSTALL "stack install --no-terminal --executable-profiling --work-dir $STACK_WORKDIR --stack-yaml $STACK_YAML"

## Copy across stack.yaml and packages.txt
ADD stack.yaml $STACK_YAML
ADD packages.txt $PACKAGES_TXT

## Basic GHC install
RUN $STACK_SETUP

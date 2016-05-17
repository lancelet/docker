# Dockerfile for Stackage LTS on Centos6, with some custom dependencies.
FROM       centos:6
MAINTAINER Jonathan Merritt <j.s.merritt@gmail.com>

## Basic dependencies
RUN yum install git gcc gcc-c++ gmp-devel zlib-devel libstdc++-devel -y

## Fetch and install stack
ENV FPC_URL https://s3.amazonaws.com/download.fpcomplete.com
RUN curl -sSL $FPC_URL/centos/6/fpco.repo | tee /etc/yum.repos.d/fpco.repo
RUN yum -y install stack

## Haskell environment
ENV PATH $HOME/local/.bin:$PATH
ENV STACK_PROJECTDIR M4_STACK_PROJECTDIR
ENV STACK_WORKDIR M4_STACK_WORKDIR
ENV STACK_YAML M4_STACK_YAML
ENV STACK_SETUP M4_STACK_SETUP
ENV STACK_INSTALL M4_STACK_INSTALL

## Copy across stack.yaml
RUN mkdir -p $STACK_PROJECTDIR
RUN mkdir -p $STACK_WORKDIR
ADD stack.yaml $STACK_YAML

## Basic GHC install
RUN $STACK_SETUP

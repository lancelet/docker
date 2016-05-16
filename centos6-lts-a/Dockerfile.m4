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
ENV STACK_SETUP stack setup \
    --no-terminal
ENV STACK_INSTALL stack install \
    --no-terminal \
    --executable-profiling \
    --no-test \
    --ghc-options -j8
ENV STACK_WORKDIR /opt/stack

## Copy across stack.yaml
RUN mkdir $STACK_WORKDIR
WORKDIR $STACK_WORKDIR
ADD stack.yaml $STACK_WORKDIR/stack.yaml
ADD dummy.cabal $STACK_WORKDIR/dummy.cabal

## Command-line tools
WORKDIR $STACK_WORKDIR
RUN $STACK_SETUP
RUN $STACK_INSTALL \
    pandoc \
    stylish-haskell \
    shake
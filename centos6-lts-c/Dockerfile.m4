# Dockerfile for Stackage LTS on Centos6, with some custom dependencies.
FROM       lancelet/centos6-lts-b:M4_DOCKER_IMAGE_VERSION
MAINTAINER Jonathan Merritt <j.s.merritt@gmail.com>

## Haskell environment
ENV PATH $HOME/local/.bin:$PATH
ENV STACK_SETUP M4_STACK_SETUP
ENV STACK_INSTALL M4_STACK_INSTALL
ENV STACK_WORKDIR M4_STACK_WORKDIR

## Copy across stack.yaml
RUN mkdir -p $STACK_WORKDIR
WORKDIR $STACK_WORKDIR
ADD stack.yaml $STACK_WORKDIR/stack.yaml
ADD dummy.cabal $STACK_WORKDIR/dummy.cabal

## Command-line tools
RUN $STACK_INSTALL \
    pandoc \
    stylish-haskell \
    shake

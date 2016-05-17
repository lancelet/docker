# Dockerfile for Stackage LTS on Centos6, with some custom dependencies.
FROM       lancelet/centos6-lts-b:latest
MAINTAINER Jonathan Merritt <j.s.merritt@gmail.com>

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

## Command-line tools
WORKDIR $STACK_PROJECTDIR
RUN $STACK_INSTALL \
    pandoc \
    stylish-haskell \
    shake

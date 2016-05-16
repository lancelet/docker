# Dockerfile for Stackage LTS on Centos6, with some custom dependencies.
FROM       lancelet/centos6-lts-a:M4_DOCKER_IMAGE_VERSION
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

## Some common libraries
WORKDIR $STACK_PROJECTDIR
RUN $STACK_INSTALL \
    SHA \
    base64-bytestring \
    byteable \
    cereal \
    cmdargs \
    digest \
    dlist \
    extra \
    hslua \
    lens \
    mtl \
    cryptonite \
    happy \
    network \
    primitive \
    socks \
    stm \
    async \
    strict \
    transformers-compat \
    exceptions \
    mmorph \
    attoparsec \
    semigroups \
    haskell-src-exts

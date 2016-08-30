# Dockerfile for Stackage LTS on Centos6, with some custom dependencies.
FROM       lancelet/centos6-lts-c:M4_DOCKER_IMAGE_VERSION
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

## Libraries
WORKDIR $STACK_PROJECTDIR
RUN $STACK_INSTALL \
    aeson \
    async \
    attoparsec \
    base16-bytestring \
    binary \
    blaze-html \
    blaze-markup \
    byteable \
    bytestring \
    bytestring-conversion \
    cassava \
    clock \
    containers \
    cryptohash \
    data-default \
    deepseq \
    dequeue \
    derive \
    directory \
    errors \
    exceptions \
    fgl \
    filepath \
    free \
    gitrev \
    graphviz \
    hashable \
    http-api-data \
    http-client \
    http-media \
    http-types \
    lens \
    monad-control \
    mtl \
    optparse-applicative \
    pipes \
    pipes-aeson \
    pipes-attoparsec \
    pipes-bytestring \
    pipes-csv \
    pipes-parse \
    pipes-safe \
    pipes-text \
    process \
    process-extras \
    quickcheck-instances \
    random \
    safe \
    servant \
    servant-blaze \
    servant-cassava \
    servant-client \
    servant-docs \
    servant-foreign \
    servant-lucid \
    servant-server \
    split \
    stm \
    tasty \
    tasty-hunit \
    tasty-quickcheck \
    tasty-th \
    template-haskell \
    text \
    th-lift \
    these \
    time \
    transformers \
    transformers-base \
    unix \
    unordered-containers \
    utf8-string \
    vector \
    wai \
    wai-extra \
    warp

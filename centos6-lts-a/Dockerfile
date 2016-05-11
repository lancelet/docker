# Dockerfile for Stackage LTS-5.12 on Centos6, with some custom dependencies.
FROM       centos:6
MAINTAINER Jonathan Merritt <j.s.merritt@gmail.com>

ENV LTS_VERSION lts-5.5

## Basic dependencies
RUN yum install git gcc gcc-c++ gmp-devel zlib-devel libstdc++-devel -y

## Fetch and install stack
RUN curl -sSL https://s3.amazonaws.com/download.fpcomplete.com/centos/6/fpco.repo | tee /etc/yum.repos.d/fpco.repo
RUN yum -y install stack

## Haskell environment
ENV PATH $HOME/local/.bin:$PATH
ENV STACK_SETUP stack setup \
    --no-terminal \
    --executable-profiling \
ENV STACK_INSTALL $STACK install \
    --no-terminal \
    --executable-profiling
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

## Libraries
WORKDIR $STACK_WORKDIR
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
    containers \
    cryptohash \
    data-default \
    deepseq \
    derive \
    directory \
    errors \
    exceptions \
    fgl \
    free \
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
    servant-server \
    split \
    stm \
    tasty \
    tasty-hunit \
    tasty-quickcheck \
    tasty-th \
    template-haskell \
    text \
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

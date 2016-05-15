# Dockerfile for Stackage LTS on Centos6, with some custom dependencies.
FROM       lancelet/centos6-lts-a:M4-DOCKER_IMAGE_VERSION
MAINTAINER Jonathan Merritt <j.s.merritt@gmail.com>

## Copy across stack.yaml
RUN mkdir $STACK_WORKDIR
WORKDIR $STACK_WORKDIR
ADD stack.yaml $STACK_WORKDIR/stack.yaml
ADD dummy.cabal $STACK_WORKDIR/dummy.cabal

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

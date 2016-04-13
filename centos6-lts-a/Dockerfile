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
ENV STACK stack
ENV STACK_WORKDIR /opt/stack

## Copy across stack.yaml
RUN mkdir $STACK_WORKDIR
WORKDIR $STACK_WORKDIR
ADD stack.yaml $STACK_WORKDIR/stack.yaml

## Command-line tools
WORKDIR $STACK_WORKDIR
RUN $STACK setup
RUN $STACK install pandoc
RUN $STACK install stylish-haskell
RUN $STACK install shake

## Libraries
WORKDIR $STACK_WORKDIR
RUN $STACK install aeson
RUN $STACK install async
RUN $STACK install attoparsec
RUN $STACK install base16-bytestring
RUN $STACK install binary
RUN $STACK install blaze-markup
RUN $STACK install blaze-html
RUN $STACK install byteable
RUN $STACK install bytestring
RUN $STACK install bytestring-conversion
RUN $STACK install cassava
RUN $STACK install cryptohash
RUN $STACK install containers
RUN $STACK install data-default
RUN $STACK install deepseq
RUN $STACK install derive
RUN $STACK install directory
RUN $STACK install errors
RUN $STACK install exceptions
RUN $STACK install fgl
RUN $STACK install graphviz
RUN $STACK install hashable
RUN $STACK install http-api-data
RUN $STACK install http-client
RUN $STACK install http-media
RUN $STACK install http-types
RUN $STACK install lens
RUN $STACK install mtl
RUN $STACK install pipes
RUN $STACK install pipes-aeson
RUN $STACK install pipes-attoparsec
RUN $STACK install pipes-bytestring
RUN $STACK install pipes-safe
RUN $STACK install pipes-text
RUN $STACK install process
RUN $STACK install process-extras
RUN $STACK install quickcheck-instances
RUN $STACK install random
RUN $STACK install safe
RUN $STACK install servant-blaze
RUN $STACK install servant-cassava
RUN $STACK install servant-client
RUN $STACK install servant-docs
RUN $STACK install servant-server
RUN $STACK install split
RUN $STACK install tasty
RUN $STACK install tasty-quickcheck
RUN $STACK install tasty-th
RUN $STACK install template-haskell
RUN $STACK install text
RUN $STACK install these
RUN $STACK install time
RUN $STACK install unix
RUN $STACK install unordered-containers
RUN $STACK install utf8-string
RUN $STACK install vector
RUN $STACK install wai
RUN $STACK install wai-extra
RUN $STACK install warp
RUN $STACK install tasty-hunit
RUN $STACK install transformers

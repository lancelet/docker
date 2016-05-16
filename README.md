Docker
======

[![Build
Status](https://travis-ci.org/lancelet/docker.svg?branch=master)](https://travis-ci.org/lancelet/docker)

> Docker images

Docker images for useful purposes.

### What is this monstrosity?

The purpose of this repository and its docker images is to provide a build
environment for a specific Haskell project (not mentioned here). The images may
or may not be useful to anyone else.

This setup is currently working around the following issues:
  1. A job limit of 50 minutes on travis.org.
  2. Lack of caching in Haskell `stack` for `extra-deps` dependencies in a
     `stack.yaml` file.

Haskell `stack` doesn't globally cache `extra-deps` dependencies that are
declared in a `stack.yaml` file. Instead, these are stored in a
project-specific cache. To get around this, dummy `.cabal` and `stack.yaml`
files are provided and a dummy project is created inside the Docker images at
`/opt/stack`. By using identical `extra-deps` and libraries, a build
environment can be created at this location which a later `stack` build can
re-use.

To combat the 50 minute limit on jobs at travis.org, the Docker build is split
into multiple images:
  - `centos-lts-a`
  - `centos-lts-b`
  - `centos-lts-c`
  - `centos-lts-b`

This is straightforward, but annoying. One annoying part of this setup is
keeping the version numbers of the multiple Docker images in sync. To achieve
this, the M4 macro processor is used to substitute version numbers across the
Dockerfiles.

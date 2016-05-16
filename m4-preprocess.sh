#!/usr/bin/env bash

# Use the M4 macro pre-processor to perform common substitutions across all
# *.m4 files in the repository.
#
# This script substitutes the environment variables referenced below in
# m4_substitutions.

set -e
set -u
set -v

# Generic substitions to make across all files.
m4_substitutions="\
    -DM4_DOCKER_IMAGE_VERSION=$DOCKER_IMAGE_VERSION \
    -DM4_STACK_SETUP=$STACK_SETUP \
    -DM4_STACK_INSTALL=$STACK_INSTALL \
    -DM4_STACK_WORKDIR=$STACK_WORKDIR \
    "

# Returns a filename without an m4 extension.
#
# For example: fileNameWithoutM4 "/opt/file.sh.m4" -> "/opt/file.sh"
fileNameWithoutM4 () {
    m4file=$1
    echo $m4file | rev | cut -f 2- -d '.' | rev
}

# Substitutes m4_substitutions in a given file, writing the result to a file
# of the same name without the .m4 extension.
substituteInFile () {
    m4file=$1
    outfile=$2
    m4 $m4_substitutions $m4file > $outfile
}

# Process all *.m4 files in the repository
filesToProcess=$(find . -name *.m4)
for file in $filesToProcess
do
    outfile=$(fileNameWithoutM4 $file)
    echo "M4 macro expanding $file to $outfile"
    substituteInFile $file $outfile
done

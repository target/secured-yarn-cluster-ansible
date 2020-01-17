#!/bin/bash

DOCKERNAME="ansibleshipyard/ansible-zookeeper"
DOCKER_DIR="dockerfiles"
# TAGS=(ubuntu centos)
TAGS=(ubuntu)
CONTEXT=.

usage() {
  local tag=$1

  echo
  echo "To pull it"
  echo "    docker pull $DOCKERNAME:$tag"
  echo
  echo "To use this docker:"
  echo "    docker run -d -P $DOCKERNAME:$tag"
  echo
  echo "To run in interactive mode for debug:"
  echo "    docker run -t -i $DOCKERNAME:$tag bash"
  echo
}

build() {
  local tag=$1

  # pushd $tag

  # Builds the image
  cmd="docker build -f $DOCKER_DIR/$tag/Dockerfile --force-rm -t $DOCKERNAME:$tag $CONTEXT"

  echo "Command to execute: [$cmd]"

  $cmd

  if [ $? == 0 ]; then
    echo "$tag build successful!"
    usage $tag
    return 0
  else
    return 1
  fi;
}

main() {
  # pushd $DOCKER_DIR
  for tag in ${TAGS[@]}; do
    build ${tag}
    if [ $? != 0 ]; then
      echo "$tag build failed!"
    fi;
  done
}

main
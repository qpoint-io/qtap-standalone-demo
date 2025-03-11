#!/bin/bash

VM_NAME="lima-qtap-demo"
DOCKER_CONTEXT="lima-qtap-demo"
DOCKER_CURRENT_CONTEXT=$(docker context show)

# check if this is a Mac, otherwise exit
if [[ "$(uname)" != "Darwin" ]]; then
  exit 0
fi

# shut down the vm
limactl stop ${VM_NAME}

# set the context back
if [ "$DOCKER_CURRENT_CONTEXT" != "$DOCKER_CONTEXT" ]; then
  docker context use "${DOCKER_CURRENT_CONTEXT}"
fi

#!/bin/bash

# check if this is a Mac, otherwise exit
if [[ "$(uname)" != "Darwin" ]]; then
  exit 0
fi

VM_NAME="lima-qtap-demo"
DOCKER_CONTEXT="lima-qtap-demo"

# custom start params
DEV_EXTRA_ARGS=()

# load .env if it exists
if [ -f .env ]; then
  # shellcheck disable=SC1091
  source .env
fi

# Check if limactl is installed
if ! command -v limactl &> /dev/null
then
    echo "limactl could not be found, installing..."
    brew install lima
fi

# Check if the VM exists and create it
if ! limactl list | grep -q "${VM_NAME}"
then
    echo "VM ${VM_NAME} does not exist, creating..."
    limactl start --name ${VM_NAME} --mount="${PWD}:w" "${DEV_EXTRA_ARGS[@]}" .vm.yaml
fi

# Check if the vm is running
 if ! limactl list | grep -q "${VM_NAME}\s*Running"
then
    echo "VM ${VM_NAME} is not running, starting..."
    limactl start ${VM_NAME}
else
    echo "VM ${VM_NAME} is already running."
fi

# Check if the Docker context exists
if ! docker context ls | grep -q "${DOCKER_CONTEXT}"
then
    echo "Docker context ${DOCKER_CONTEXT} does not exist, creating..."
    docker context create ${DOCKER_CONTEXT} --docker "host=unix://$HOME/.lima/lima-qtap-demo/sock/docker.sock"
else
    echo "Docker context ${DOCKER_CONTEXT} already exists."
fi

# Set the Docker context
docker context use ${DOCKER_CONTEXT}

#!/bin/bash

docker run --rm -it \
  --name qtap \
  --user 0:0 \
  --privileged \
  --cap-add CAP_BPF \
  --cap-add CAP_SYS_ADMIN \
  --pid=host \
  --network=host \
  -v /sys:/sys \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$(pwd):/app" \
  -e TINI_SUBREAPER=1 \
  --ulimit=memlock=-1 \
  us-docker.pkg.dev/qpoint-edge/public/qpoint:v0.8 \
  tap \
  --log-level=info \
  --log-encoding=console \
  --config=/app/qtap.yaml

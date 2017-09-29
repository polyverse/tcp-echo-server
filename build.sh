#! /bin/bash
pv build -f Dockerfile.alpine -n tcp_echo_server.alpine $1 docker
pv build -f Dockerfile.centos -n tcp_echo_server.centos $1 docker
pv build -f Dockerfile.ubuntu -n tcp_echo_server.ubuntu $1 docker

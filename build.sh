#! /bin/bash
pv build -f Dockerfile.alpine -n tcp_echo_server.alpine docker
pv build -f Dockerfile.centos -n tcp_echo_server.centos docker
pv build -f Dockerfile.ubuntu -n tcp_echo_server.ubuntu docker
